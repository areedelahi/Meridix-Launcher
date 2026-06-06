// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_file_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocalFileItem {
  String get path;
  String get name;
  int get sizeBytes;
  bool get isEnabled;
  bool get isDirectory;
  DateTime get lastModified;

  /// Create a copy of LocalFileItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocalFileItemCopyWith<LocalFileItem> get copyWith =>
      _$LocalFileItemCopyWithImpl<LocalFileItem>(
          this as LocalFileItem, _$identity);

  /// Serializes this LocalFileItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocalFileItem &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sizeBytes, sizeBytes) ||
                other.sizeBytes == sizeBytes) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled) &&
            (identical(other.isDirectory, isDirectory) ||
                other.isDirectory == isDirectory) &&
            (identical(other.lastModified, lastModified) ||
                other.lastModified == lastModified));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, path, name, sizeBytes, isEnabled, isDirectory, lastModified);

  @override
  String toString() {
    return 'LocalFileItem(path: $path, name: $name, sizeBytes: $sizeBytes, isEnabled: $isEnabled, isDirectory: $isDirectory, lastModified: $lastModified)';
  }
}

/// @nodoc
abstract mixin class $LocalFileItemCopyWith<$Res> {
  factory $LocalFileItemCopyWith(
          LocalFileItem value, $Res Function(LocalFileItem) _then) =
      _$LocalFileItemCopyWithImpl;
  @useResult
  $Res call(
      {String path,
      String name,
      int sizeBytes,
      bool isEnabled,
      bool isDirectory,
      DateTime lastModified});
}

/// @nodoc
class _$LocalFileItemCopyWithImpl<$Res>
    implements $LocalFileItemCopyWith<$Res> {
  _$LocalFileItemCopyWithImpl(this._self, this._then);

  final LocalFileItem _self;
  final $Res Function(LocalFileItem) _then;

  /// Create a copy of LocalFileItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? name = null,
    Object? sizeBytes = null,
    Object? isEnabled = null,
    Object? isDirectory = null,
    Object? lastModified = null,
  }) {
    return _then(_self.copyWith(
      path: null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sizeBytes: null == sizeBytes
          ? _self.sizeBytes
          : sizeBytes // ignore: cast_nullable_to_non_nullable
              as int,
      isEnabled: null == isEnabled
          ? _self.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isDirectory: null == isDirectory
          ? _self.isDirectory
          : isDirectory // ignore: cast_nullable_to_non_nullable
              as bool,
      lastModified: null == lastModified
          ? _self.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [LocalFileItem].
extension LocalFileItemPatterns on LocalFileItem {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_LocalFileItem value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocalFileItem() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_LocalFileItem value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocalFileItem():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_LocalFileItem value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocalFileItem() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String path, String name, int sizeBytes, bool isEnabled,
            bool isDirectory, DateTime lastModified)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LocalFileItem() when $default != null:
        return $default(_that.path, _that.name, _that.sizeBytes,
            _that.isEnabled, _that.isDirectory, _that.lastModified);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String path, String name, int sizeBytes, bool isEnabled,
            bool isDirectory, DateTime lastModified)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocalFileItem():
        return $default(_that.path, _that.name, _that.sizeBytes,
            _that.isEnabled, _that.isDirectory, _that.lastModified);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String path, String name, int sizeBytes, bool isEnabled,
            bool isDirectory, DateTime lastModified)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LocalFileItem() when $default != null:
        return $default(_that.path, _that.name, _that.sizeBytes,
            _that.isEnabled, _that.isDirectory, _that.lastModified);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _LocalFileItem implements LocalFileItem {
  const _LocalFileItem(
      {required this.path,
      required this.name,
      required this.sizeBytes,
      required this.isEnabled,
      required this.isDirectory,
      required this.lastModified});
  factory _LocalFileItem.fromJson(Map<String, dynamic> json) =>
      _$LocalFileItemFromJson(json);

  @override
  final String path;
  @override
  final String name;
  @override
  final int sizeBytes;
  @override
  final bool isEnabled;
  @override
  final bool isDirectory;
  @override
  final DateTime lastModified;

  /// Create a copy of LocalFileItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocalFileItemCopyWith<_LocalFileItem> get copyWith =>
      __$LocalFileItemCopyWithImpl<_LocalFileItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LocalFileItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocalFileItem &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sizeBytes, sizeBytes) ||
                other.sizeBytes == sizeBytes) &&
            (identical(other.isEnabled, isEnabled) ||
                other.isEnabled == isEnabled) &&
            (identical(other.isDirectory, isDirectory) ||
                other.isDirectory == isDirectory) &&
            (identical(other.lastModified, lastModified) ||
                other.lastModified == lastModified));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, path, name, sizeBytes, isEnabled, isDirectory, lastModified);

  @override
  String toString() {
    return 'LocalFileItem(path: $path, name: $name, sizeBytes: $sizeBytes, isEnabled: $isEnabled, isDirectory: $isDirectory, lastModified: $lastModified)';
  }
}

/// @nodoc
abstract mixin class _$LocalFileItemCopyWith<$Res>
    implements $LocalFileItemCopyWith<$Res> {
  factory _$LocalFileItemCopyWith(
          _LocalFileItem value, $Res Function(_LocalFileItem) _then) =
      __$LocalFileItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String path,
      String name,
      int sizeBytes,
      bool isEnabled,
      bool isDirectory,
      DateTime lastModified});
}

/// @nodoc
class __$LocalFileItemCopyWithImpl<$Res>
    implements _$LocalFileItemCopyWith<$Res> {
  __$LocalFileItemCopyWithImpl(this._self, this._then);

  final _LocalFileItem _self;
  final $Res Function(_LocalFileItem) _then;

  /// Create a copy of LocalFileItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? path = null,
    Object? name = null,
    Object? sizeBytes = null,
    Object? isEnabled = null,
    Object? isDirectory = null,
    Object? lastModified = null,
  }) {
    return _then(_LocalFileItem(
      path: null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sizeBytes: null == sizeBytes
          ? _self.sizeBytes
          : sizeBytes // ignore: cast_nullable_to_non_nullable
              as int,
      isEnabled: null == isEnabled
          ? _self.isEnabled
          : isEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isDirectory: null == isDirectory
          ? _self.isDirectory
          : isDirectory // ignore: cast_nullable_to_non_nullable
              as bool,
      lastModified: null == lastModified
          ? _self.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
