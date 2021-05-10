// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'costume_image_watcher_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CostumeImageWatcherEventTearOff {
  const _$CostumeImageWatcherEventTearOff();

  StartListeningForImages startListeningForImages(String costumeId) {
    return StartListeningForImages(
      costumeId,
    );
  }

  ReceivedImages receivedImages(List<CostumeImage> images) {
    return ReceivedImages(
      images,
    );
  }
}

/// @nodoc
const $CostumeImageWatcherEvent = _$CostumeImageWatcherEventTearOff();

/// @nodoc
mixin _$CostumeImageWatcherEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String costumeId) startListeningForImages,
    required TResult Function(List<CostumeImage> images) receivedImages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String costumeId)? startListeningForImages,
    TResult Function(List<CostumeImage> images)? receivedImages,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartListeningForImages value)
        startListeningForImages,
    required TResult Function(ReceivedImages value) receivedImages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartListeningForImages value)? startListeningForImages,
    TResult Function(ReceivedImages value)? receivedImages,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CostumeImageWatcherEventCopyWith<$Res> {
  factory $CostumeImageWatcherEventCopyWith(CostumeImageWatcherEvent value,
          $Res Function(CostumeImageWatcherEvent) then) =
      _$CostumeImageWatcherEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CostumeImageWatcherEventCopyWithImpl<$Res>
    implements $CostumeImageWatcherEventCopyWith<$Res> {
  _$CostumeImageWatcherEventCopyWithImpl(this._value, this._then);

  final CostumeImageWatcherEvent _value;
  // ignore: unused_field
  final $Res Function(CostumeImageWatcherEvent) _then;
}

/// @nodoc
abstract class $StartListeningForImagesCopyWith<$Res> {
  factory $StartListeningForImagesCopyWith(StartListeningForImages value,
          $Res Function(StartListeningForImages) then) =
      _$StartListeningForImagesCopyWithImpl<$Res>;
  $Res call({String costumeId});
}

/// @nodoc
class _$StartListeningForImagesCopyWithImpl<$Res>
    extends _$CostumeImageWatcherEventCopyWithImpl<$Res>
    implements $StartListeningForImagesCopyWith<$Res> {
  _$StartListeningForImagesCopyWithImpl(StartListeningForImages _value,
      $Res Function(StartListeningForImages) _then)
      : super(_value, (v) => _then(v as StartListeningForImages));

  @override
  StartListeningForImages get _value => super._value as StartListeningForImages;

  @override
  $Res call({
    Object? costumeId = freezed,
  }) {
    return _then(StartListeningForImages(
      costumeId == freezed
          ? _value.costumeId
          : costumeId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StartListeningForImages implements StartListeningForImages {
  const _$StartListeningForImages(this.costumeId);

  @override
  final String costumeId;

  @override
  String toString() {
    return 'CostumeImageWatcherEvent.startListeningForImages(costumeId: $costumeId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StartListeningForImages &&
            (identical(other.costumeId, costumeId) ||
                const DeepCollectionEquality()
                    .equals(other.costumeId, costumeId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(costumeId);

  @JsonKey(ignore: true)
  @override
  $StartListeningForImagesCopyWith<StartListeningForImages> get copyWith =>
      _$StartListeningForImagesCopyWithImpl<StartListeningForImages>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String costumeId) startListeningForImages,
    required TResult Function(List<CostumeImage> images) receivedImages,
  }) {
    return startListeningForImages(costumeId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String costumeId)? startListeningForImages,
    TResult Function(List<CostumeImage> images)? receivedImages,
    required TResult orElse(),
  }) {
    if (startListeningForImages != null) {
      return startListeningForImages(costumeId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartListeningForImages value)
        startListeningForImages,
    required TResult Function(ReceivedImages value) receivedImages,
  }) {
    return startListeningForImages(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartListeningForImages value)? startListeningForImages,
    TResult Function(ReceivedImages value)? receivedImages,
    required TResult orElse(),
  }) {
    if (startListeningForImages != null) {
      return startListeningForImages(this);
    }
    return orElse();
  }
}

abstract class StartListeningForImages implements CostumeImageWatcherEvent {
  const factory StartListeningForImages(String costumeId) =
      _$StartListeningForImages;

  String get costumeId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StartListeningForImagesCopyWith<StartListeningForImages> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceivedImagesCopyWith<$Res> {
  factory $ReceivedImagesCopyWith(
          ReceivedImages value, $Res Function(ReceivedImages) then) =
      _$ReceivedImagesCopyWithImpl<$Res>;
  $Res call({List<CostumeImage> images});
}

/// @nodoc
class _$ReceivedImagesCopyWithImpl<$Res>
    extends _$CostumeImageWatcherEventCopyWithImpl<$Res>
    implements $ReceivedImagesCopyWith<$Res> {
  _$ReceivedImagesCopyWithImpl(
      ReceivedImages _value, $Res Function(ReceivedImages) _then)
      : super(_value, (v) => _then(v as ReceivedImages));

  @override
  ReceivedImages get _value => super._value as ReceivedImages;

  @override
  $Res call({
    Object? images = freezed,
  }) {
    return _then(ReceivedImages(
      images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<CostumeImage>,
    ));
  }
}

/// @nodoc

class _$ReceivedImages implements ReceivedImages {
  const _$ReceivedImages(this.images);

  @override
  final List<CostumeImage> images;

  @override
  String toString() {
    return 'CostumeImageWatcherEvent.receivedImages(images: $images)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ReceivedImages &&
            (identical(other.images, images) ||
                const DeepCollectionEquality().equals(other.images, images)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(images);

  @JsonKey(ignore: true)
  @override
  $ReceivedImagesCopyWith<ReceivedImages> get copyWith =>
      _$ReceivedImagesCopyWithImpl<ReceivedImages>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String costumeId) startListeningForImages,
    required TResult Function(List<CostumeImage> images) receivedImages,
  }) {
    return receivedImages(images);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String costumeId)? startListeningForImages,
    TResult Function(List<CostumeImage> images)? receivedImages,
    required TResult orElse(),
  }) {
    if (receivedImages != null) {
      return receivedImages(images);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartListeningForImages value)
        startListeningForImages,
    required TResult Function(ReceivedImages value) receivedImages,
  }) {
    return receivedImages(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartListeningForImages value)? startListeningForImages,
    TResult Function(ReceivedImages value)? receivedImages,
    required TResult orElse(),
  }) {
    if (receivedImages != null) {
      return receivedImages(this);
    }
    return orElse();
  }
}

abstract class ReceivedImages implements CostumeImageWatcherEvent {
  const factory ReceivedImages(List<CostumeImage> images) = _$ReceivedImages;

  List<CostumeImage> get images => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReceivedImagesCopyWith<ReceivedImages> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$CostumeImageWatcherStateTearOff {
  const _$CostumeImageWatcherStateTearOff();

  Initial initial() {
    return Initial();
  }

  Loading loading() {
    return Loading();
  }

  Success success(List<CostumeImage> images) {
    return Success(
      images,
    );
  }
}

/// @nodoc
const $CostumeImageWatcherState = _$CostumeImageWatcherStateTearOff();

/// @nodoc
mixin _$CostumeImageWatcherState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<CostumeImage> images) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CostumeImage> images)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CostumeImageWatcherStateCopyWith<$Res> {
  factory $CostumeImageWatcherStateCopyWith(CostumeImageWatcherState value,
          $Res Function(CostumeImageWatcherState) then) =
      _$CostumeImageWatcherStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CostumeImageWatcherStateCopyWithImpl<$Res>
    implements $CostumeImageWatcherStateCopyWith<$Res> {
  _$CostumeImageWatcherStateCopyWithImpl(this._value, this._then);

  final CostumeImageWatcherState _value;
  // ignore: unused_field
  final $Res Function(CostumeImageWatcherState) _then;
}

/// @nodoc
abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialCopyWithImpl<$Res>
    extends _$CostumeImageWatcherStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

/// @nodoc

class _$Initial implements Initial {
  _$Initial();

  @override
  String toString() {
    return 'CostumeImageWatcherState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<CostumeImage> images) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CostumeImage> images)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements CostumeImageWatcherState {
  factory Initial() = _$Initial;
}

/// @nodoc
abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingCopyWithImpl<$Res>
    extends _$CostumeImageWatcherStateCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
}

/// @nodoc

class _$Loading implements Loading {
  _$Loading();

  @override
  String toString() {
    return 'CostumeImageWatcherState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<CostumeImage> images) success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CostumeImage> images)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements CostumeImageWatcherState {
  factory Loading() = _$Loading;
}

/// @nodoc
abstract class $SuccessCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) then) =
      _$SuccessCopyWithImpl<$Res>;
  $Res call({List<CostumeImage> images});
}

/// @nodoc
class _$SuccessCopyWithImpl<$Res>
    extends _$CostumeImageWatcherStateCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(Success _value, $Res Function(Success) _then)
      : super(_value, (v) => _then(v as Success));

  @override
  Success get _value => super._value as Success;

  @override
  $Res call({
    Object? images = freezed,
  }) {
    return _then(Success(
      images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<CostumeImage>,
    ));
  }
}

/// @nodoc

class _$Success implements Success {
  _$Success(this.images);

  @override
  final List<CostumeImage> images;

  @override
  String toString() {
    return 'CostumeImageWatcherState.success(images: $images)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Success &&
            (identical(other.images, images) ||
                const DeepCollectionEquality().equals(other.images, images)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(images);

  @JsonKey(ignore: true)
  @override
  $SuccessCopyWith<Success> get copyWith =>
      _$SuccessCopyWithImpl<Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<CostumeImage> images) success,
  }) {
    return success(images);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<CostumeImage> images)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(images);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements CostumeImageWatcherState {
  factory Success(List<CostumeImage> images) = _$Success;

  List<CostumeImage> get images => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuccessCopyWith<Success> get copyWith => throw _privateConstructorUsedError;
}
