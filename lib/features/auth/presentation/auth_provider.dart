import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart' as enc;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:dio/dio.dart';
import '../domain/user_account.dart';
import '../data/ms_auth_service.dart';

const _kAccountsFileName = 'accounts.dat';
const _kAccountsKey = 'liquid_launcher_accounts';

// AES-256 key for macOS file-based storage (used when Keychain signing
// is unavailable, i.e. unsigned debug builds).
final _encKey = enc.Key(Uint8List.fromList(
  'LiquidLauncherV1SecretKey!XMCLS1'.codeUnits,
));
final _encrypter = enc.Encrypter(enc.AES(_encKey, mode: enc.AESMode.cbc));

// ── State ─────────────────────────────────────────────────────────────────────

enum AuthStatus { idle, signingIn, refreshing, error }

class AuthState {
  const AuthState({
    this.accounts = const [],
    this.status = AuthStatus.idle,
    this.errorMessage,
    this.refreshingUuid,
  });

  final List<UserAccount> accounts;
  final AuthStatus status;
  final String? errorMessage;

  /// UUID of the account currently being refreshed (null when not refreshing).
  final String? refreshingUuid;

  UserAccount? get activeAccount {
    for (final a in accounts) {
      if (a.isActive) return a;
    }
    return accounts.isEmpty ? null : accounts.first;
  }

  bool get isSigningIn => status == AuthStatus.signingIn;

  /// True if at least one Microsoft account is present.
  /// Offline accounts are only allowed when this is true — ensures the user
  /// owns a legitimate copy of Minecraft.
  bool get hasMicrosoftAccount => accounts.any((a) => a.type == 'microsoft');

  AuthState copyWith({
    List<UserAccount>? accounts,
    AuthStatus? status,
    String? errorMessage,
    String? refreshingUuid,
    bool clearRefreshingUuid = false,
    bool clearError = false,
  }) {
    return AuthState(
      accounts: accounts ?? this.accounts,
      status: status ?? this.status,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      refreshingUuid:
          clearRefreshingUuid ? null : (refreshingUuid ?? this.refreshingUuid),
    );
  }
}

// ── Notifier ──────────────────────────────────────────────────────────────────

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState()) {
    _load();
  }

  final _ms = MsAuthService();
  final _uuid = const Uuid();

  // ── Persistence ──────────────────────────────────────────────────────────
  //
  // Strategy:
  //   • Windows / Linux → flutter_secure_storage (Credential Manager / libsecret)
  //                        No signing required on either platform.
  //   • macOS            → AES-256 encrypted file via path_provider.
  //                        Keychain requires a paid Apple signing cert; we avoid
  //                        that for now and upgrade when the app is notarized.

  static bool get _useSecureStorage => !Platform.isMacOS;

  final _secureStorage = const FlutterSecureStorage();

  Future<File> _getStorageFile() async {
    final dir = await getApplicationSupportDirectory();
    return File('${dir.path}/$_kAccountsFileName');
  }

  Future<void> _load() async {
    try {
      if (_useSecureStorage) {
        // Windows / Linux path
        final raw = await _secureStorage.read(key: _kAccountsKey);
        if (raw == null) return;
        final list = (jsonDecode(raw) as List)
            .map((e) => UserAccount.fromJson(e as Map<String, dynamic>))
            .toList();
        state = state.copyWith(accounts: list);
      } else {
        // macOS path — AES-encrypted file
        final file = await _getStorageFile();
        if (!await file.exists()) return;
        final raw = await file.readAsString();
        final parts = raw.split(':');
        if (parts.length != 2) return;
        final iv = enc.IV.fromBase64(parts[0]);
        final decrypted = _encrypter.decrypt64(parts[1], iv: iv);
        final list = (jsonDecode(decrypted) as List)
            .map((e) => UserAccount.fromJson(e as Map<String, dynamic>))
            .toList();
        state = state.copyWith(accounts: list);
      }
    } catch (_) {
      // Corrupt storage — wipe and start fresh
      if (_useSecureStorage) {
        await _secureStorage.delete(key: _kAccountsKey);
      } else {
        final file = await _getStorageFile();
        if (await file.exists()) await file.delete();
      }
    }
  }

  Future<void> _save() async {
    final plaintext =
        jsonEncode(state.accounts.map((a) => a.toJson()).toList());
    if (_useSecureStorage) {
      await _secureStorage.write(key: _kAccountsKey, value: plaintext);
    } else {
      final file = await _getStorageFile();
      final iv = enc.IV.fromSecureRandom(16);
      final encrypted = _encrypter.encrypt(plaintext, iv: iv);
      await file.writeAsString('${iv.base64}:${encrypted.base64}');
    }
  }

  // ── Microsoft OAuth ───────────────────────────────────────────────────────

  /// Opens the browser for MS login and adds the account on success.
  Future<void> loginWithMicrosoft(BuildContext context) async {
    if (state.isSigningIn) return;
    state = state.copyWith(status: AuthStatus.signingIn, errorMessage: null);

    try {
      final account = await _ms.loginWithBrowser(context);

      final existingIndex =
          state.accounts.indexWhere((a) => a.uuid == account.uuid);

      List<UserAccount> updated;
      if (existingIndex >= 0) {
        // Account already exists — refresh tokens in-place, keep it active
        updated = List.from(state.accounts);
        updated[existingIndex] = account.copyWith(isActive: true);
        // Deactivate others
        updated = updated
            .asMap()
            .entries
            .map((e) => e.value.copyWith(isActive: e.key == existingIndex))
            .toList();
      } else {
        // New account — deactivate all others and append
        updated =
            state.accounts.map((a) => a.copyWith(isActive: false)).toList();
        updated.add(account.copyWith(isActive: true));
      }

      state = state.copyWith(accounts: updated, status: AuthStatus.idle);
      await _save();
    } on Exception catch (e, stack) {
      String msg = e.toString();
      if (e is DioException && e.response != null) {
        msg = 'DioError: ${e.response?.statusCode} - ${e.response?.data}';
      }
      print('OAUTH ERROR: $msg');
      print(stack);
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: _friendlyError(msg),
      );
    }
  }

  /// Refresh expired tokens silently (called automatically before launch).
  Future<void> refreshIfNeeded(String uuid) async {
    final index = state.accounts.indexWhere((a) => a.uuid == uuid);
    if (index < 0) return;
    final account = state.accounts[index];
    if (!account.isExpired || account.type != 'microsoft') return;

    try {
      final refreshed = await _ms.refreshAccount(account);
      final updated = List<UserAccount>.from(state.accounts);
      updated[index] = refreshed;
      state = state.copyWith(accounts: updated);
      await _save();
    } catch (_) {
      // Silent — next launch will prompt re-login
    }
  }

  /// Manually refresh an account token (triggered by the Refresh Token button).
  /// Shows a per-account refreshing spinner. Throws on failure so the UI can
  /// show a snackbar.
  Future<void> refreshAccount(String uuid) async {
    final index = state.accounts.indexWhere((a) => a.uuid == uuid);
    if (index < 0) return;
    final account = state.accounts[index];
    if (account.type != 'microsoft') return;

    state = state.copyWith(
      status: AuthStatus.refreshing,
      refreshingUuid: uuid,
    );

    try {
      final refreshed = await _ms.refreshAccount(account);
      final updated = List<UserAccount>.from(state.accounts);
      updated[index] = refreshed;
      state = state.copyWith(
        accounts: updated,
        status: AuthStatus.idle,
        clearRefreshingUuid: true,
      );
      await _save();
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.idle,
        clearRefreshingUuid: true,
      );
      rethrow;
    }
  }

  /// Uploads a skin and re-fetches the skin URL to update the stored account.
  Future<void> uploadSkin({
    required String uuid,
    required String filePath,
    required String variant,
  }) async {
    final index = state.accounts.indexWhere((a) => a.uuid == uuid);
    if (index < 0) return;
    final account = state.accounts[index];
    if (account.type != 'microsoft') return;

    await _ms.uploadSkin(
      mcAccessToken: account.accessToken,
      filePath: filePath,
      variant: variant,
    );

    // Poll Mojang until the skin URL changes (max 1 minute)
    final currentSkinUrl = account.skinUrl;
    for (int i = 0; i < 12; i++) {
      await Future.delayed(const Duration(seconds: 5));
      try {
        final newSkinUrl = await _ms.fetchSkinUrl(account.accessToken);
        if (newSkinUrl != currentSkinUrl) break; // Mojang updated!
      } catch (_) {}
    }

    // Refresh to update local state
    await refreshAccount(uuid);
  }

  Future<void> setCape({
    required String uuid,
    required String? capeId, // null to unequip
  }) async {
    final index = state.accounts.indexWhere((a) => a.uuid == uuid);
    if (index < 0) return;
    final account = state.accounts[index];
    if (account.type != 'microsoft') return;

    if (capeId == null) {
      await _ms.unequipCape(mcAccessToken: account.accessToken);
    } else {
      await _ms.equipCape(
        mcAccessToken: account.accessToken,
        capeId: capeId,
      );
    }

    // Optimistically update the local state immediately
    final updated = List<UserAccount>.from(state.accounts);
    updated[index] = account.copyWith(activeCapeId: capeId);
    state = state.copyWith(accounts: updated);
    await _save();

    // Background refresh
    refreshAccount(uuid);
  }

  // ── Offline account ───────────────────────────────────────────────────────

  void addOfflineAccount(String username) {
    // Require at least one real Microsoft account before allowing offline.
    if (!state.hasMicrosoftAccount) return;

    final trimmed = username.trim();
    if (trimmed.isEmpty) return;

    // Prevent duplicates
    final exists = state.accounts.any(
      (a) =>
          a.type == 'offline' &&
          a.username.toLowerCase() == trimmed.toLowerCase(),
    );
    if (exists) return;

    final id = _generateOfflineUuid(trimmed);
    final account = UserAccount(
      uuid: id,
      username: trimmed,
      type: 'offline',
      accessToken: '',
      refreshToken: '',
      expiresAt: DateTime(9999), // offline = never expires
      isActive: true,
    );

    // Deactivate others
    final current =
        state.accounts.map((a) => a.copyWith(isActive: false)).toList();
    current.add(account);

    state = state.copyWith(accounts: current);
    _save();
  }

  /// Generates a deterministic offline UUID exactly how Minecraft servers do it.
  /// MD5 hash of "OfflinePlayer:username" with UUID v3 version/variant bits set.
  String _generateOfflineUuid(String username) {
    final data = utf8.encode('OfflinePlayer:$username');
    final hashBytes = md5.convert(data).bytes;

    final modified = List<int>.from(hashBytes);
    // Set version to 3
    modified[6] = (modified[6] & 0x0f) | 0x30;
    // Set variant to RFC4122 (10xx)
    modified[8] = (modified[8] & 0x3f) | 0x80;

    String hex(List<int> bytes) =>
        bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();

    return '${hex(modified.sublist(0, 4))}-${hex(modified.sublist(4, 6))}-${hex(modified.sublist(6, 8))}-${hex(modified.sublist(8, 10))}-${hex(modified.sublist(10, 16))}';
  }

  // ── Account management ────────────────────────────────────────────────────

  void setActive(String uuid) {
    final updated = state.accounts.map((a) {
      return a.copyWith(isActive: a.uuid == uuid);
    }).toList();
    state = state.copyWith(accounts: updated);
    _save();
  }

  void removeAccount(String uuid) {
    var updated = state.accounts.where((a) => a.uuid != uuid).toList();
    // Make first remaining active if the active was removed
    if (updated.isNotEmpty && !updated.any((a) => a.isActive)) {
      updated = [updated.first.copyWith(isActive: true), ...updated.skip(1)];
    }
    state = state.copyWith(accounts: updated);
    _save();
  }

  void clearError() {
    state = state.copyWith(status: AuthStatus.idle, clearError: true);
  }

  // ── Helpers ───────────────────────────────────────────────────────────────

  String _friendlyError(String raw) {
    if (raw.contains('Could not open browser')) {
      return 'Could not open browser. Please set a default browser and try again.';
    }
    if (raw.contains('timed out')) return 'Login timed out. Please try again.';
    if (raw.contains('xbox.com')) return raw;
    if (raw.contains('child account')) return raw;
    // Always show raw error for debugging right now
    return 'Sign-in failed: $raw';
  }
}

// ── Provider ──────────────────────────────────────────────────────────────────

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});
