

part of 'installer.dart';

T _$identity<T>(T value) => value;

mixin _$DartLoaderSpec {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DartLoaderSpec);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DartLoaderSpec()';
  }
}

class $DartLoaderSpecCopyWith<$Res> {
  $DartLoaderSpecCopyWith(DartLoaderSpec _, $Res Function(DartLoaderSpec) __);
}

extension DartLoaderSpecPatterns on DartLoaderSpec {

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DartLoaderSpec_Vanilla value)? vanilla,
    TResult Function(DartLoaderSpec_Fabric value)? fabric,
    TResult Function(DartLoaderSpec_Forge value)? forge,
    TResult Function(DartLoaderSpec_Quilt value)? quilt,
    TResult Function(DartLoaderSpec_NeoForge value)? neoForge,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DartLoaderSpec_Vanilla() when vanilla != null:
        return vanilla(_that);
      case DartLoaderSpec_Fabric() when fabric != null:
        return fabric(_that);
      case DartLoaderSpec_Forge() when forge != null:
        return forge(_that);
      case DartLoaderSpec_Quilt() when quilt != null:
        return quilt(_that);
      case DartLoaderSpec_NeoForge() when neoForge != null:
        return neoForge(_that);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DartLoaderSpec_Vanilla value) vanilla,
    required TResult Function(DartLoaderSpec_Fabric value) fabric,
    required TResult Function(DartLoaderSpec_Forge value) forge,
    required TResult Function(DartLoaderSpec_Quilt value) quilt,
    required TResult Function(DartLoaderSpec_NeoForge value) neoForge,
  }) {
    final _that = this;
    switch (_that) {
      case DartLoaderSpec_Vanilla():
        return vanilla(_that);
      case DartLoaderSpec_Fabric():
        return fabric(_that);
      case DartLoaderSpec_Forge():
        return forge(_that);
      case DartLoaderSpec_Quilt():
        return quilt(_that);
      case DartLoaderSpec_NeoForge():
        return neoForge(_that);
    }
  }

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DartLoaderSpec_Vanilla value)? vanilla,
    TResult? Function(DartLoaderSpec_Fabric value)? fabric,
    TResult? Function(DartLoaderSpec_Forge value)? forge,
    TResult? Function(DartLoaderSpec_Quilt value)? quilt,
    TResult? Function(DartLoaderSpec_NeoForge value)? neoForge,
  }) {
    final _that = this;
    switch (_that) {
      case DartLoaderSpec_Vanilla() when vanilla != null:
        return vanilla(_that);
      case DartLoaderSpec_Fabric() when fabric != null:
        return fabric(_that);
      case DartLoaderSpec_Forge() when forge != null:
        return forge(_that);
      case DartLoaderSpec_Quilt() when quilt != null:
        return quilt(_that);
      case DartLoaderSpec_NeoForge() when neoForge != null:
        return neoForge(_that);
      case _:
        return null;
    }
  }

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? vanilla,
    TResult Function(String version)? fabric,
    TResult Function(String version)? forge,
    TResult Function(String version)? quilt,
    TResult Function(String version)? neoForge,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DartLoaderSpec_Vanilla() when vanilla != null:
        return vanilla();
      case DartLoaderSpec_Fabric() when fabric != null:
        return fabric(_that.version);
      case DartLoaderSpec_Forge() when forge != null:
        return forge(_that.version);
      case DartLoaderSpec_Quilt() when quilt != null:
        return quilt(_that.version);
      case DartLoaderSpec_NeoForge() when neoForge != null:
        return neoForge(_that.version);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() vanilla,
    required TResult Function(String version) fabric,
    required TResult Function(String version) forge,
    required TResult Function(String version) quilt,
    required TResult Function(String version) neoForge,
  }) {
    final _that = this;
    switch (_that) {
      case DartLoaderSpec_Vanilla():
        return vanilla();
      case DartLoaderSpec_Fabric():
        return fabric(_that.version);
      case DartLoaderSpec_Forge():
        return forge(_that.version);
      case DartLoaderSpec_Quilt():
        return quilt(_that.version);
      case DartLoaderSpec_NeoForge():
        return neoForge(_that.version);
    }
  }

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? vanilla,
    TResult? Function(String version)? fabric,
    TResult? Function(String version)? forge,
    TResult? Function(String version)? quilt,
    TResult? Function(String version)? neoForge,
  }) {
    final _that = this;
    switch (_that) {
      case DartLoaderSpec_Vanilla() when vanilla != null:
        return vanilla();
      case DartLoaderSpec_Fabric() when fabric != null:
        return fabric(_that.version);
      case DartLoaderSpec_Forge() when forge != null:
        return forge(_that.version);
      case DartLoaderSpec_Quilt() when quilt != null:
        return quilt(_that.version);
      case DartLoaderSpec_NeoForge() when neoForge != null:
        return neoForge(_that.version);
      case _:
        return null;
    }
  }
}

class DartLoaderSpec_Vanilla extends DartLoaderSpec {
  const DartLoaderSpec_Vanilla() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DartLoaderSpec_Vanilla);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DartLoaderSpec.vanilla()';
  }
}

class DartLoaderSpec_Fabric extends DartLoaderSpec {
  const DartLoaderSpec_Fabric({required this.version}) : super._();

  final String version;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DartLoaderSpec_FabricCopyWith<DartLoaderSpec_Fabric> get copyWith =>
      _$DartLoaderSpec_FabricCopyWithImpl<DartLoaderSpec_Fabric>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DartLoaderSpec_Fabric &&
            (identical(other.version, version) || other.version == version));
  }

  @override
  int get hashCode => Object.hash(runtimeType, version);

  @override
  String toString() {
    return 'DartLoaderSpec.fabric(version: $version)';
  }
}

abstract mixin class $DartLoaderSpec_FabricCopyWith<$Res>
    implements $DartLoaderSpecCopyWith<$Res> {
  factory $DartLoaderSpec_FabricCopyWith(DartLoaderSpec_Fabric value,
          $Res Function(DartLoaderSpec_Fabric) _then) =
      _$DartLoaderSpec_FabricCopyWithImpl;
  @useResult
  $Res call({String version});
}

class _$DartLoaderSpec_FabricCopyWithImpl<$Res>
    implements $DartLoaderSpec_FabricCopyWith<$Res> {
  _$DartLoaderSpec_FabricCopyWithImpl(this._self, this._then);

  final DartLoaderSpec_Fabric _self;
  final $Res Function(DartLoaderSpec_Fabric) _then;

  @pragma('vm:prefer-inline')
  $Res call({
    Object? version = null,
  }) {
    return _then(DartLoaderSpec_Fabric(
      version: null == version
          ? _self.version
          : version 
              as String,
    ));
  }
}

class DartLoaderSpec_Forge extends DartLoaderSpec {
  const DartLoaderSpec_Forge({required this.version}) : super._();

  final String version;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DartLoaderSpec_ForgeCopyWith<DartLoaderSpec_Forge> get copyWith =>
      _$DartLoaderSpec_ForgeCopyWithImpl<DartLoaderSpec_Forge>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DartLoaderSpec_Forge &&
            (identical(other.version, version) || other.version == version));
  }

  @override
  int get hashCode => Object.hash(runtimeType, version);

  @override
  String toString() {
    return 'DartLoaderSpec.forge(version: $version)';
  }
}

abstract mixin class $DartLoaderSpec_ForgeCopyWith<$Res>
    implements $DartLoaderSpecCopyWith<$Res> {
  factory $DartLoaderSpec_ForgeCopyWith(DartLoaderSpec_Forge value,
          $Res Function(DartLoaderSpec_Forge) _then) =
      _$DartLoaderSpec_ForgeCopyWithImpl;
  @useResult
  $Res call({String version});
}

class _$DartLoaderSpec_ForgeCopyWithImpl<$Res>
    implements $DartLoaderSpec_ForgeCopyWith<$Res> {
  _$DartLoaderSpec_ForgeCopyWithImpl(this._self, this._then);

  final DartLoaderSpec_Forge _self;
  final $Res Function(DartLoaderSpec_Forge) _then;

  @pragma('vm:prefer-inline')
  $Res call({
    Object? version = null,
  }) {
    return _then(DartLoaderSpec_Forge(
      version: null == version
          ? _self.version
          : version 
              as String,
    ));
  }
}

class DartLoaderSpec_Quilt extends DartLoaderSpec {
  const DartLoaderSpec_Quilt({required this.version}) : super._();

  final String version;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DartLoaderSpec_QuiltCopyWith<DartLoaderSpec_Quilt> get copyWith =>
      _$DartLoaderSpec_QuiltCopyWithImpl<DartLoaderSpec_Quilt>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DartLoaderSpec_Quilt &&
            (identical(other.version, version) || other.version == version));
  }

  @override
  int get hashCode => Object.hash(runtimeType, version);

  @override
  String toString() {
    return 'DartLoaderSpec.quilt(version: $version)';
  }
}

abstract mixin class $DartLoaderSpec_QuiltCopyWith<$Res>
    implements $DartLoaderSpecCopyWith<$Res> {
  factory $DartLoaderSpec_QuiltCopyWith(DartLoaderSpec_Quilt value,
          $Res Function(DartLoaderSpec_Quilt) _then) =
      _$DartLoaderSpec_QuiltCopyWithImpl;
  @useResult
  $Res call({String version});
}

class _$DartLoaderSpec_QuiltCopyWithImpl<$Res>
    implements $DartLoaderSpec_QuiltCopyWith<$Res> {
  _$DartLoaderSpec_QuiltCopyWithImpl(this._self, this._then);

  final DartLoaderSpec_Quilt _self;
  final $Res Function(DartLoaderSpec_Quilt) _then;

  @pragma('vm:prefer-inline')
  $Res call({
    Object? version = null,
  }) {
    return _then(DartLoaderSpec_Quilt(
      version: null == version
          ? _self.version
          : version 
              as String,
    ));
  }
}

class DartLoaderSpec_NeoForge extends DartLoaderSpec {
  const DartLoaderSpec_NeoForge({required this.version}) : super._();

  final String version;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DartLoaderSpec_NeoForgeCopyWith<DartLoaderSpec_NeoForge> get copyWith =>
      _$DartLoaderSpec_NeoForgeCopyWithImpl<DartLoaderSpec_NeoForge>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DartLoaderSpec_NeoForge &&
            (identical(other.version, version) || other.version == version));
  }

  @override
  int get hashCode => Object.hash(runtimeType, version);

  @override
  String toString() {
    return 'DartLoaderSpec.neoForge(version: $version)';
  }
}

abstract mixin class $DartLoaderSpec_NeoForgeCopyWith<$Res>
    implements $DartLoaderSpecCopyWith<$Res> {
  factory $DartLoaderSpec_NeoForgeCopyWith(DartLoaderSpec_NeoForge value,
          $Res Function(DartLoaderSpec_NeoForge) _then) =
      _$DartLoaderSpec_NeoForgeCopyWithImpl;
  @useResult
  $Res call({String version});
}

class _$DartLoaderSpec_NeoForgeCopyWithImpl<$Res>
    implements $DartLoaderSpec_NeoForgeCopyWith<$Res> {
  _$DartLoaderSpec_NeoForgeCopyWithImpl(this._self, this._then);

  final DartLoaderSpec_NeoForge _self;
  final $Res Function(DartLoaderSpec_NeoForge) _then;

  @pragma('vm:prefer-inline')
  $Res call({
    Object? version = null,
  }) {
    return _then(DartLoaderSpec_NeoForge(
      version: null == version
          ? _self.version
          : version 
              as String,
    ));
  }
}

mixin _$DartProgressEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DartProgressEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DartProgressEvent()';
  }
}

class $DartProgressEventCopyWith<$Res> {
  $DartProgressEventCopyWith(
      DartProgressEvent _, $Res Function(DartProgressEvent) __);
}

extension DartProgressEventPatterns on DartProgressEvent {

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DartProgressEvent_StageStarted value)? stageStarted,
    TResult Function(DartProgressEvent_TaskStarted value)? taskStarted,
    TResult Function(DartProgressEvent_TaskSkipped value)? taskSkipped,
    TResult Function(DartProgressEvent_TaskFinished value)? taskFinished,
    TResult Function(DartProgressEvent_BytesReceived value)? bytesReceived,
    TResult Function(DartProgressEvent_PlanProgress value)? planProgress,
    TResult Function(DartProgressEvent_InstallComplete value)? installComplete,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DartProgressEvent_StageStarted() when stageStarted != null:
        return stageStarted(_that);
      case DartProgressEvent_TaskStarted() when taskStarted != null:
        return taskStarted(_that);
      case DartProgressEvent_TaskSkipped() when taskSkipped != null:
        return taskSkipped(_that);
      case DartProgressEvent_TaskFinished() when taskFinished != null:
        return taskFinished(_that);
      case DartProgressEvent_BytesReceived() when bytesReceived != null:
        return bytesReceived(_that);
      case DartProgressEvent_PlanProgress() when planProgress != null:
        return planProgress(_that);
      case DartProgressEvent_InstallComplete() when installComplete != null:
        return installComplete(_that);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DartProgressEvent_StageStarted value)
        stageStarted,
    required TResult Function(DartProgressEvent_TaskStarted value) taskStarted,
    required TResult Function(DartProgressEvent_TaskSkipped value) taskSkipped,
    required TResult Function(DartProgressEvent_TaskFinished value)
        taskFinished,
    required TResult Function(DartProgressEvent_BytesReceived value)
        bytesReceived,
    required TResult Function(DartProgressEvent_PlanProgress value)
        planProgress,
    required TResult Function(DartProgressEvent_InstallComplete value)
        installComplete,
  }) {
    final _that = this;
    switch (_that) {
      case DartProgressEvent_StageStarted():
        return stageStarted(_that);
      case DartProgressEvent_TaskStarted():
        return taskStarted(_that);
      case DartProgressEvent_TaskSkipped():
        return taskSkipped(_that);
      case DartProgressEvent_TaskFinished():
        return taskFinished(_that);
      case DartProgressEvent_BytesReceived():
        return bytesReceived(_that);
      case DartProgressEvent_PlanProgress():
        return planProgress(_that);
      case DartProgressEvent_InstallComplete():
        return installComplete(_that);
    }
  }

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DartProgressEvent_StageStarted value)? stageStarted,
    TResult? Function(DartProgressEvent_TaskStarted value)? taskStarted,
    TResult? Function(DartProgressEvent_TaskSkipped value)? taskSkipped,
    TResult? Function(DartProgressEvent_TaskFinished value)? taskFinished,
    TResult? Function(DartProgressEvent_BytesReceived value)? bytesReceived,
    TResult? Function(DartProgressEvent_PlanProgress value)? planProgress,
    TResult? Function(DartProgressEvent_InstallComplete value)? installComplete,
  }) {
    final _that = this;
    switch (_that) {
      case DartProgressEvent_StageStarted() when stageStarted != null:
        return stageStarted(_that);
      case DartProgressEvent_TaskStarted() when taskStarted != null:
        return taskStarted(_that);
      case DartProgressEvent_TaskSkipped() when taskSkipped != null:
        return taskSkipped(_that);
      case DartProgressEvent_TaskFinished() when taskFinished != null:
        return taskFinished(_that);
      case DartProgressEvent_BytesReceived() when bytesReceived != null:
        return bytesReceived(_that);
      case DartProgressEvent_PlanProgress() when planProgress != null:
        return planProgress(_that);
      case DartProgressEvent_InstallComplete() when installComplete != null:
        return installComplete(_that);
      case _:
        return null;
    }
  }

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String stage)? stageStarted,
    TResult Function(String label, String path)? taskStarted,
    TResult Function(String label, String reason)? taskSkipped,
    TResult Function(String label)? taskFinished,
    TResult Function(String label, BigInt received, BigInt? total)?
        bytesReceived,
    TResult Function(BigInt completedBytes, BigInt totalBytes)? planProgress,
    TResult Function(String versionId)? installComplete,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DartProgressEvent_StageStarted() when stageStarted != null:
        return stageStarted(_that.stage);
      case DartProgressEvent_TaskStarted() when taskStarted != null:
        return taskStarted(_that.label, _that.path);
      case DartProgressEvent_TaskSkipped() when taskSkipped != null:
        return taskSkipped(_that.label, _that.reason);
      case DartProgressEvent_TaskFinished() when taskFinished != null:
        return taskFinished(_that.label);
      case DartProgressEvent_BytesReceived() when bytesReceived != null:
        return bytesReceived(_that.label, _that.received, _that.total);
      case DartProgressEvent_PlanProgress() when planProgress != null:
        return planProgress(_that.completedBytes, _that.totalBytes);
      case DartProgressEvent_InstallComplete() when installComplete != null:
        return installComplete(_that.versionId);
      case _:
        return orElse();
    }
  }

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String stage) stageStarted,
    required TResult Function(String label, String path) taskStarted,
    required TResult Function(String label, String reason) taskSkipped,
    required TResult Function(String label) taskFinished,
    required TResult Function(String label, BigInt received, BigInt? total)
        bytesReceived,
    required TResult Function(BigInt completedBytes, BigInt totalBytes)
        planProgress,
    required TResult Function(String versionId) installComplete,
  }) {
    final _that = this;
    switch (_that) {
      case DartProgressEvent_StageStarted():
        return stageStarted(_that.stage);
      case DartProgressEvent_TaskStarted():
        return taskStarted(_that.label, _that.path);
      case DartProgressEvent_TaskSkipped():
        return taskSkipped(_that.label, _that.reason);
      case DartProgressEvent_TaskFinished():
        return taskFinished(_that.label);
      case DartProgressEvent_BytesReceived():
        return bytesReceived(_that.label, _that.received, _that.total);
      case DartProgressEvent_PlanProgress():
        return planProgress(_that.completedBytes, _that.totalBytes);
      case DartProgressEvent_InstallComplete():
        return installComplete(_that.versionId);
    }
  }

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String stage)? stageStarted,
    TResult? Function(String label, String path)? taskStarted,
    TResult? Function(String label, String reason)? taskSkipped,
    TResult? Function(String label)? taskFinished,
    TResult? Function(String label, BigInt received, BigInt? total)?
        bytesReceived,
    TResult? Function(BigInt completedBytes, BigInt totalBytes)? planProgress,
    TResult? Function(String versionId)? installComplete,
  }) {
    final _that = this;
    switch (_that) {
      case DartProgressEvent_StageStarted() when stageStarted != null:
        return stageStarted(_that.stage);
      case DartProgressEvent_TaskStarted() when taskStarted != null:
        return taskStarted(_that.label, _that.path);
      case DartProgressEvent_TaskSkipped() when taskSkipped != null:
        return taskSkipped(_that.label, _that.reason);
      case DartProgressEvent_TaskFinished() when taskFinished != null:
        return taskFinished(_that.label);
      case DartProgressEvent_BytesReceived() when bytesReceived != null:
        return bytesReceived(_that.label, _that.received, _that.total);
      case DartProgressEvent_PlanProgress() when planProgress != null:
        return planProgress(_that.completedBytes, _that.totalBytes);
      case DartProgressEvent_InstallComplete() when installComplete != null:
        return installComplete(_that.versionId);
      case _:
        return null;
    }
  }
}

class DartProgressEvent_StageStarted extends DartProgressEvent {
  const DartProgressEvent_StageStarted({required this.stage}) : super._();

  final String stage;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DartProgressEvent_StageStartedCopyWith<DartProgressEvent_StageStarted>
      get copyWith => _$DartProgressEvent_StageStartedCopyWithImpl<
          DartProgressEvent_StageStarted>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DartProgressEvent_StageStarted &&
            (identical(other.stage, stage) || other.stage == stage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stage);

  @override
  String toString() {
    return 'DartProgressEvent.stageStarted(stage: $stage)';
  }
}

abstract mixin class $DartProgressEvent_StageStartedCopyWith<$Res>
    implements $DartProgressEventCopyWith<$Res> {
  factory $DartProgressEvent_StageStartedCopyWith(
          DartProgressEvent_StageStarted value,
          $Res Function(DartProgressEvent_StageStarted) _then) =
      _$DartProgressEvent_StageStartedCopyWithImpl;
  @useResult
  $Res call({String stage});
}

class _$DartProgressEvent_StageStartedCopyWithImpl<$Res>
    implements $DartProgressEvent_StageStartedCopyWith<$Res> {
  _$DartProgressEvent_StageStartedCopyWithImpl(this._self, this._then);

  final DartProgressEvent_StageStarted _self;
  final $Res Function(DartProgressEvent_StageStarted) _then;

  @pragma('vm:prefer-inline')
  $Res call({
    Object? stage = null,
  }) {
    return _then(DartProgressEvent_StageStarted(
      stage: null == stage
          ? _self.stage
          : stage 
              as String,
    ));
  }
}

class DartProgressEvent_TaskStarted extends DartProgressEvent {
  const DartProgressEvent_TaskStarted({required this.label, required this.path})
      : super._();

  final String label;
  final String path;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DartProgressEvent_TaskStartedCopyWith<DartProgressEvent_TaskStarted>
      get copyWith => _$DartProgressEvent_TaskStartedCopyWithImpl<
          DartProgressEvent_TaskStarted>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DartProgressEvent_TaskStarted &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, path);

  @override
  String toString() {
    return 'DartProgressEvent.taskStarted(label: $label, path: $path)';
  }
}

abstract mixin class $DartProgressEvent_TaskStartedCopyWith<$Res>
    implements $DartProgressEventCopyWith<$Res> {
  factory $DartProgressEvent_TaskStartedCopyWith(
          DartProgressEvent_TaskStarted value,
          $Res Function(DartProgressEvent_TaskStarted) _then) =
      _$DartProgressEvent_TaskStartedCopyWithImpl;
  @useResult
  $Res call({String label, String path});
}

class _$DartProgressEvent_TaskStartedCopyWithImpl<$Res>
    implements $DartProgressEvent_TaskStartedCopyWith<$Res> {
  _$DartProgressEvent_TaskStartedCopyWithImpl(this._self, this._then);

  final DartProgressEvent_TaskStarted _self;
  final $Res Function(DartProgressEvent_TaskStarted) _then;

  @pragma('vm:prefer-inline')
  $Res call({
    Object? label = null,
    Object? path = null,
  }) {
    return _then(DartProgressEvent_TaskStarted(
      label: null == label
          ? _self.label
          : label 
              as String,
      path: null == path
          ? _self.path
          : path 
              as String,
    ));
  }
}

class DartProgressEvent_TaskSkipped extends DartProgressEvent {
  const DartProgressEvent_TaskSkipped(
      {required this.label, required this.reason})
      : super._();

  final String label;
  final String reason;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DartProgressEvent_TaskSkippedCopyWith<DartProgressEvent_TaskSkipped>
      get copyWith => _$DartProgressEvent_TaskSkippedCopyWithImpl<
          DartProgressEvent_TaskSkipped>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DartProgressEvent_TaskSkipped &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, reason);

  @override
  String toString() {
    return 'DartProgressEvent.taskSkipped(label: $label, reason: $reason)';
  }
}

abstract mixin class $DartProgressEvent_TaskSkippedCopyWith<$Res>
    implements $DartProgressEventCopyWith<$Res> {
  factory $DartProgressEvent_TaskSkippedCopyWith(
          DartProgressEvent_TaskSkipped value,
          $Res Function(DartProgressEvent_TaskSkipped) _then) =
      _$DartProgressEvent_TaskSkippedCopyWithImpl;
  @useResult
  $Res call({String label, String reason});
}

class _$DartProgressEvent_TaskSkippedCopyWithImpl<$Res>
    implements $DartProgressEvent_TaskSkippedCopyWith<$Res> {
  _$DartProgressEvent_TaskSkippedCopyWithImpl(this._self, this._then);

  final DartProgressEvent_TaskSkipped _self;
  final $Res Function(DartProgressEvent_TaskSkipped) _then;

  @pragma('vm:prefer-inline')
  $Res call({
    Object? label = null,
    Object? reason = null,
  }) {
    return _then(DartProgressEvent_TaskSkipped(
      label: null == label
          ? _self.label
          : label 
              as String,
      reason: null == reason
          ? _self.reason
          : reason 
              as String,
    ));
  }
}

class DartProgressEvent_TaskFinished extends DartProgressEvent {
  const DartProgressEvent_TaskFinished({required this.label}) : super._();

  final String label;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DartProgressEvent_TaskFinishedCopyWith<DartProgressEvent_TaskFinished>
      get copyWith => _$DartProgressEvent_TaskFinishedCopyWithImpl<
          DartProgressEvent_TaskFinished>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DartProgressEvent_TaskFinished &&
            (identical(other.label, label) || other.label == label));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label);

  @override
  String toString() {
    return 'DartProgressEvent.taskFinished(label: $label)';
  }
}

abstract mixin class $DartProgressEvent_TaskFinishedCopyWith<$Res>
    implements $DartProgressEventCopyWith<$Res> {
  factory $DartProgressEvent_TaskFinishedCopyWith(
          DartProgressEvent_TaskFinished value,
          $Res Function(DartProgressEvent_TaskFinished) _then) =
      _$DartProgressEvent_TaskFinishedCopyWithImpl;
  @useResult
  $Res call({String label});
}

class _$DartProgressEvent_TaskFinishedCopyWithImpl<$Res>
    implements $DartProgressEvent_TaskFinishedCopyWith<$Res> {
  _$DartProgressEvent_TaskFinishedCopyWithImpl(this._self, this._then);

  final DartProgressEvent_TaskFinished _self;
  final $Res Function(DartProgressEvent_TaskFinished) _then;

  @pragma('vm:prefer-inline')
  $Res call({
    Object? label = null,
  }) {
    return _then(DartProgressEvent_TaskFinished(
      label: null == label
          ? _self.label
          : label 
              as String,
    ));
  }
}

class DartProgressEvent_BytesReceived extends DartProgressEvent {
  const DartProgressEvent_BytesReceived(
      {required this.label, required this.received, this.total})
      : super._();

  final String label;
  final BigInt received;
  final BigInt? total;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DartProgressEvent_BytesReceivedCopyWith<DartProgressEvent_BytesReceived>
      get copyWith => _$DartProgressEvent_BytesReceivedCopyWithImpl<
          DartProgressEvent_BytesReceived>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DartProgressEvent_BytesReceived &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.received, received) ||
                other.received == received) &&
            (identical(other.total, total) || other.total == total));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, received, total);

  @override
  String toString() {
    return 'DartProgressEvent.bytesReceived(label: $label, received: $received, total: $total)';
  }
}

abstract mixin class $DartProgressEvent_BytesReceivedCopyWith<$Res>
    implements $DartProgressEventCopyWith<$Res> {
  factory $DartProgressEvent_BytesReceivedCopyWith(
          DartProgressEvent_BytesReceived value,
          $Res Function(DartProgressEvent_BytesReceived) _then) =
      _$DartProgressEvent_BytesReceivedCopyWithImpl;
  @useResult
  $Res call({String label, BigInt received, BigInt? total});
}

class _$DartProgressEvent_BytesReceivedCopyWithImpl<$Res>
    implements $DartProgressEvent_BytesReceivedCopyWith<$Res> {
  _$DartProgressEvent_BytesReceivedCopyWithImpl(this._self, this._then);

  final DartProgressEvent_BytesReceived _self;
  final $Res Function(DartProgressEvent_BytesReceived) _then;

  @pragma('vm:prefer-inline')
  $Res call({
    Object? label = null,
    Object? received = null,
    Object? total = freezed,
  }) {
    return _then(DartProgressEvent_BytesReceived(
      label: null == label
          ? _self.label
          : label 
              as String,
      received: null == received
          ? _self.received
          : received 
              as BigInt,
      total: freezed == total
          ? _self.total
          : total 
              as BigInt?,
    ));
  }
}

class DartProgressEvent_PlanProgress extends DartProgressEvent {
  const DartProgressEvent_PlanProgress(
      {required this.completedBytes, required this.totalBytes})
      : super._();

  final BigInt completedBytes;
  final BigInt totalBytes;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DartProgressEvent_PlanProgressCopyWith<DartProgressEvent_PlanProgress>
      get copyWith => _$DartProgressEvent_PlanProgressCopyWithImpl<
          DartProgressEvent_PlanProgress>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DartProgressEvent_PlanProgress &&
            (identical(other.completedBytes, completedBytes) ||
                other.completedBytes == completedBytes) &&
            (identical(other.totalBytes, totalBytes) ||
                other.totalBytes == totalBytes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, completedBytes, totalBytes);

  @override
  String toString() {
    return 'DartProgressEvent.planProgress(completedBytes: $completedBytes, totalBytes: $totalBytes)';
  }
}

abstract mixin class $DartProgressEvent_PlanProgressCopyWith<$Res>
    implements $DartProgressEventCopyWith<$Res> {
  factory $DartProgressEvent_PlanProgressCopyWith(
          DartProgressEvent_PlanProgress value,
          $Res Function(DartProgressEvent_PlanProgress) _then) =
      _$DartProgressEvent_PlanProgressCopyWithImpl;
  @useResult
  $Res call({BigInt completedBytes, BigInt totalBytes});
}

class _$DartProgressEvent_PlanProgressCopyWithImpl<$Res>
    implements $DartProgressEvent_PlanProgressCopyWith<$Res> {
  _$DartProgressEvent_PlanProgressCopyWithImpl(this._self, this._then);

  final DartProgressEvent_PlanProgress _self;
  final $Res Function(DartProgressEvent_PlanProgress) _then;

  @pragma('vm:prefer-inline')
  $Res call({
    Object? completedBytes = null,
    Object? totalBytes = null,
  }) {
    return _then(DartProgressEvent_PlanProgress(
      completedBytes: null == completedBytes
          ? _self.completedBytes
          : completedBytes 
              as BigInt,
      totalBytes: null == totalBytes
          ? _self.totalBytes
          : totalBytes 
              as BigInt,
    ));
  }
}

class DartProgressEvent_InstallComplete extends DartProgressEvent {
  const DartProgressEvent_InstallComplete({required this.versionId})
      : super._();

  final String versionId;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DartProgressEvent_InstallCompleteCopyWith<DartProgressEvent_InstallComplete>
      get copyWith => _$DartProgressEvent_InstallCompleteCopyWithImpl<
          DartProgressEvent_InstallComplete>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DartProgressEvent_InstallComplete &&
            (identical(other.versionId, versionId) ||
                other.versionId == versionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, versionId);

  @override
  String toString() {
    return 'DartProgressEvent.installComplete(versionId: $versionId)';
  }
}

abstract mixin class $DartProgressEvent_InstallCompleteCopyWith<$Res>
    implements $DartProgressEventCopyWith<$Res> {
  factory $DartProgressEvent_InstallCompleteCopyWith(
          DartProgressEvent_InstallComplete value,
          $Res Function(DartProgressEvent_InstallComplete) _then) =
      _$DartProgressEvent_InstallCompleteCopyWithImpl;
  @useResult
  $Res call({String versionId});
}

class _$DartProgressEvent_InstallCompleteCopyWithImpl<$Res>
    implements $DartProgressEvent_InstallCompleteCopyWith<$Res> {
  _$DartProgressEvent_InstallCompleteCopyWithImpl(this._self, this._then);

  final DartProgressEvent_InstallComplete _self;
  final $Res Function(DartProgressEvent_InstallComplete) _then;

  @pragma('vm:prefer-inline')
  $Res call({
    Object? versionId = null,
  }) {
    return _then(DartProgressEvent_InstallComplete(
      versionId: null == versionId
          ? _self.versionId
          : versionId 
              as String,
    ));
  }
}

