

part of 'launcher.dart';

T _$identity<T>(T value) => value;

mixin _$LaunchEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LaunchEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LaunchEvent()';
  }
}

class $LaunchEventCopyWith<$Res> {
  $LaunchEventCopyWith(LaunchEvent _, $Res Function(LaunchEvent) __);
}

extension LaunchEventPatterns on LaunchEvent {

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LaunchEvent_Started value)? started,
    TResult Function(LaunchEvent_Exited value)? exited,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LaunchEvent_Started() when started != null:
        return started(_that);
      case LaunchEvent_Exited() when exited != null:
        return exited(_that);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LaunchEvent_Started value) started,
    required TResult Function(LaunchEvent_Exited value) exited,
  }) {
    final _that = this;
    switch (_that) {
      case LaunchEvent_Started():
        return started(_that);
      case LaunchEvent_Exited():
        return exited(_that);
    }
  }

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LaunchEvent_Started value)? started,
    TResult? Function(LaunchEvent_Exited value)? exited,
  }) {
    final _that = this;
    switch (_that) {
      case LaunchEvent_Started() when started != null:
        return started(_that);
      case LaunchEvent_Exited() when exited != null:
        return exited(_that);
      case _:
        return null;
    }
  }

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int pid)? started,
    TResult Function(int code)? exited,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case LaunchEvent_Started() when started != null:
        return started(_that.pid);
      case LaunchEvent_Exited() when exited != null:
        return exited(_that.code);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int pid) started,
    required TResult Function(int code) exited,
  }) {
    final _that = this;
    switch (_that) {
      case LaunchEvent_Started():
        return started(_that.pid);
      case LaunchEvent_Exited():
        return exited(_that.code);
    }
  }

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int pid)? started,
    TResult? Function(int code)? exited,
  }) {
    final _that = this;
    switch (_that) {
      case LaunchEvent_Started() when started != null:
        return started(_that.pid);
      case LaunchEvent_Exited() when exited != null:
        return exited(_that.code);
      case _:
        return null;
    }
  }
}

class LaunchEvent_Started extends LaunchEvent {
  const LaunchEvent_Started({required this.pid}) : super._();

  final int pid;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LaunchEvent_StartedCopyWith<LaunchEvent_Started> get copyWith =>
      _$LaunchEvent_StartedCopyWithImpl<LaunchEvent_Started>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LaunchEvent_Started &&
            (identical(other.pid, pid) || other.pid == pid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pid);

  @override
  String toString() {
    return 'LaunchEvent.started(pid: $pid)';
  }
}

abstract mixin class $LaunchEvent_StartedCopyWith<$Res>
    implements $LaunchEventCopyWith<$Res> {
  factory $LaunchEvent_StartedCopyWith(
          LaunchEvent_Started value, $Res Function(LaunchEvent_Started) _then) =
      _$LaunchEvent_StartedCopyWithImpl;
  @useResult
  $Res call({int pid});
}

class _$LaunchEvent_StartedCopyWithImpl<$Res>
    implements $LaunchEvent_StartedCopyWith<$Res> {
  _$LaunchEvent_StartedCopyWithImpl(this._self, this._then);

  final LaunchEvent_Started _self;
  final $Res Function(LaunchEvent_Started) _then;

  @pragma('vm:prefer-inline')
  $Res call({
    Object? pid = null,
  }) {
    return _then(LaunchEvent_Started(
      pid: null == pid
          ? _self.pid
          : pid 
              as int,
    ));
  }
}

class LaunchEvent_Exited extends LaunchEvent {
  const LaunchEvent_Exited({required this.code}) : super._();

  final int code;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LaunchEvent_ExitedCopyWith<LaunchEvent_Exited> get copyWith =>
      _$LaunchEvent_ExitedCopyWithImpl<LaunchEvent_Exited>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LaunchEvent_Exited &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code);

  @override
  String toString() {
    return 'LaunchEvent.exited(code: $code)';
  }
}

abstract mixin class $LaunchEvent_ExitedCopyWith<$Res>
    implements $LaunchEventCopyWith<$Res> {
  factory $LaunchEvent_ExitedCopyWith(
          LaunchEvent_Exited value, $Res Function(LaunchEvent_Exited) _then) =
      _$LaunchEvent_ExitedCopyWithImpl;
  @useResult
  $Res call({int code});
}

class _$LaunchEvent_ExitedCopyWithImpl<$Res>
    implements $LaunchEvent_ExitedCopyWith<$Res> {
  _$LaunchEvent_ExitedCopyWithImpl(this._self, this._then);

  final LaunchEvent_Exited _self;
  final $Res Function(LaunchEvent_Exited) _then;

  @pragma('vm:prefer-inline')
  $Res call({
    Object? code = null,
  }) {
    return _then(LaunchEvent_Exited(
      code: null == code
          ? _self.code
          : code 
              as int,
    ));
  }
}

