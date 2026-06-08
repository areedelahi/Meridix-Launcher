

import '../frb_generated.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

Future<DeviceCodeInfo> requestDeviceCode() =>
    RustLib.instance.api.crateApiAuthRequestDeviceCode();

Future<MinecraftAccount> pollForTokenAndLogin(
        {required String deviceCode, required BigInt interval}) =>
    RustLib.instance.api.crateApiAuthPollForTokenAndLogin(
        deviceCode: deviceCode, interval: interval);

class DeviceCodeInfo {
  final String userCode;
  final String deviceCode;
  final String verificationUri;
  final BigInt expiresIn;
  final BigInt interval;

  const DeviceCodeInfo({
    required this.userCode,
    required this.deviceCode,
    required this.verificationUri,
    required this.expiresIn,
    required this.interval,
  });

  @override
  int get hashCode =>
      userCode.hashCode ^
      deviceCode.hashCode ^
      verificationUri.hashCode ^
      expiresIn.hashCode ^
      interval.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeviceCodeInfo &&
          runtimeType == other.runtimeType &&
          userCode == other.userCode &&
          deviceCode == other.deviceCode &&
          verificationUri == other.verificationUri &&
          expiresIn == other.expiresIn &&
          interval == other.interval;
}

class MinecraftAccount {
  final String uuid;
  final String username;
  final String accessToken;

  const MinecraftAccount({
    required this.uuid,
    required this.username,
    required this.accessToken,
  });

  @override
  int get hashCode => uuid.hashCode ^ username.hashCode ^ accessToken.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MinecraftAccount &&
          runtimeType == other.runtimeType &&
          uuid == other.uuid &&
          username == other.username &&
          accessToken == other.accessToken;
}
