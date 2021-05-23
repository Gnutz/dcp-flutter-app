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

  AddImage addImage(String imagePath) {
    return AddImage(
      imagePath,
    );
  }

  DeleteImage deleteImage(CostumeImage image) {
    return DeleteImage(
      image,
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
    required TResult Function(String imagePath) addImage,
    required TResult Function(CostumeImage image) deleteImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String costumeId)? startListeningForImages,
    TResult Function(List<CostumeImage> images)? receivedImages,
    TResult Function(String imagePath)? addImage,
    TResult Function(CostumeImage image)? deleteImage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartListeningForImages value)
        startListeningForImages,
    required TResult Function(ReceivedImages value) receivedImages,
    required TResult Function(AddImage value) addImage,
    required TResult Function(DeleteImage value) deleteImage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartListeningForImages value)? startListeningForImages,
    TResult Function(ReceivedImages value)? receivedImages,
    TResult Function(AddImage value)? addImage,
    TResult Function(DeleteImage value)? deleteImage,
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
    required TResult Function(String imagePath) addImage,
    required TResult Function(CostumeImage image) deleteImage,
  }) {
    return startListeningForImages(costumeId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String costumeId)? startListeningForImages,
    TResult Function(List<CostumeImage> images)? receivedImages,
    TResult Function(String imagePath)? addImage,
    TResult Function(CostumeImage image)? deleteImage,
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
    required TResult Function(AddImage value) addImage,
    required TResult Function(DeleteImage value) deleteImage,
  }) {
    return startListeningForImages(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartListeningForImages value)? startListeningForImages,
    TResult Function(ReceivedImages value)? receivedImages,
    TResult Function(AddImage value)? addImage,
    TResult Function(DeleteImage value)? deleteImage,
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
    required TResult Function(String imagePath) addImage,
    required TResult Function(CostumeImage image) deleteImage,
  }) {
    return receivedImages(images);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String costumeId)? startListeningForImages,
    TResult Function(List<CostumeImage> images)? receivedImages,
    TResult Function(String imagePath)? addImage,
    TResult Function(CostumeImage image)? deleteImage,
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
    required TResult Function(AddImage value) addImage,
    required TResult Function(DeleteImage value) deleteImage,
  }) {
    return receivedImages(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartListeningForImages value)? startListeningForImages,
    TResult Function(ReceivedImages value)? receivedImages,
    TResult Function(AddImage value)? addImage,
    TResult Function(DeleteImage value)? deleteImage,
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
abstract class $AddImageCopyWith<$Res> {
  factory $AddImageCopyWith(AddImage value, $Res Function(AddImage) then) =
      _$AddImageCopyWithImpl<$Res>;
  $Res call({String imagePath});
}

/// @nodoc
class _$AddImageCopyWithImpl<$Res>
    extends _$CostumeImageWatcherEventCopyWithImpl<$Res>
    implements $AddImageCopyWith<$Res> {
  _$AddImageCopyWithImpl(AddImage _value, $Res Function(AddImage) _then)
      : super(_value, (v) => _then(v as AddImage));

  @override
  AddImage get _value => super._value as AddImage;

  @override
  $Res call({
    Object? imagePath = freezed,
  }) {
    return _then(AddImage(
      imagePath == freezed
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddImage implements AddImage {
  const _$AddImage(this.imagePath);

  @override
  final String imagePath;

  @override
  String toString() {
    return 'CostumeImageWatcherEvent.addImage(imagePath: $imagePath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AddImage &&
            (identical(other.imagePath, imagePath) ||
                const DeepCollectionEquality()
                    .equals(other.imagePath, imagePath)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(imagePath);

  @JsonKey(ignore: true)
  @override
  $AddImageCopyWith<AddImage> get copyWith =>
      _$AddImageCopyWithImpl<AddImage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String costumeId) startListeningForImages,
    required TResult Function(List<CostumeImage> images) receivedImages,
    required TResult Function(String imagePath) addImage,
    required TResult Function(CostumeImage image) deleteImage,
  }) {
    return addImage(imagePath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String costumeId)? startListeningForImages,
    TResult Function(List<CostumeImage> images)? receivedImages,
    TResult Function(String imagePath)? addImage,
    TResult Function(CostumeImage image)? deleteImage,
    required TResult orElse(),
  }) {
    if (addImage != null) {
      return addImage(imagePath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartListeningForImages value)
        startListeningForImages,
    required TResult Function(ReceivedImages value) receivedImages,
    required TResult Function(AddImage value) addImage,
    required TResult Function(DeleteImage value) deleteImage,
  }) {
    return addImage(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartListeningForImages value)? startListeningForImages,
    TResult Function(ReceivedImages value)? receivedImages,
    TResult Function(AddImage value)? addImage,
    TResult Function(DeleteImage value)? deleteImage,
    required TResult orElse(),
  }) {
    if (addImage != null) {
      return addImage(this);
    }
    return orElse();
  }
}

abstract class AddImage implements CostumeImageWatcherEvent {
  const factory AddImage(String imagePath) = _$AddImage;

  String get imagePath => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddImageCopyWith<AddImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteImageCopyWith<$Res> {
  factory $DeleteImageCopyWith(
          DeleteImage value, $Res Function(DeleteImage) then) =
      _$DeleteImageCopyWithImpl<$Res>;
  $Res call({CostumeImage image});
}

/// @nodoc
class _$DeleteImageCopyWithImpl<$Res>
    extends _$CostumeImageWatcherEventCopyWithImpl<$Res>
    implements $DeleteImageCopyWith<$Res> {
  _$DeleteImageCopyWithImpl(
      DeleteImage _value, $Res Function(DeleteImage) _then)
      : super(_value, (v) => _then(v as DeleteImage));

  @override
  DeleteImage get _value => super._value as DeleteImage;

  @override
  $Res call({
    Object? image = freezed,
  }) {
    return _then(DeleteImage(
      image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as CostumeImage,
    ));
  }
}

/// @nodoc

class _$DeleteImage implements DeleteImage {
  const _$DeleteImage(this.image);

  @override
  final CostumeImage image;

  @override
  String toString() {
    return 'CostumeImageWatcherEvent.deleteImage(image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeleteImage &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(image);

  @JsonKey(ignore: true)
  @override
  $DeleteImageCopyWith<DeleteImage> get copyWith =>
      _$DeleteImageCopyWithImpl<DeleteImage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String costumeId) startListeningForImages,
    required TResult Function(List<CostumeImage> images) receivedImages,
    required TResult Function(String imagePath) addImage,
    required TResult Function(CostumeImage image) deleteImage,
  }) {
    return deleteImage(image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String costumeId)? startListeningForImages,
    TResult Function(List<CostumeImage> images)? receivedImages,
    TResult Function(String imagePath)? addImage,
    TResult Function(CostumeImage image)? deleteImage,
    required TResult orElse(),
  }) {
    if (deleteImage != null) {
      return deleteImage(image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StartListeningForImages value)
        startListeningForImages,
    required TResult Function(ReceivedImages value) receivedImages,
    required TResult Function(AddImage value) addImage,
    required TResult Function(DeleteImage value) deleteImage,
  }) {
    return deleteImage(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StartListeningForImages value)? startListeningForImages,
    TResult Function(ReceivedImages value)? receivedImages,
    TResult Function(AddImage value)? addImage,
    TResult Function(DeleteImage value)? deleteImage,
    required TResult orElse(),
  }) {
    if (deleteImage != null) {
      return deleteImage(this);
    }
    return orElse();
  }
}

abstract class DeleteImage implements CostumeImageWatcherEvent {
  const factory DeleteImage(CostumeImage image) = _$DeleteImage;

  CostumeImage get image => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeleteImageCopyWith<DeleteImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$CostumeImageWatcherStateTearOff {
  const _$CostumeImageWatcherStateTearOff();

  _CostumeImageWatcherState call({required List<CostumeImage> images}) {
    return _CostumeImageWatcherState(
      images: images,
    );
  }
}

/// @nodoc
const $CostumeImageWatcherState = _$CostumeImageWatcherStateTearOff();

/// @nodoc
mixin _$CostumeImageWatcherState {
  List<CostumeImage> get images => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CostumeImageWatcherStateCopyWith<CostumeImageWatcherState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CostumeImageWatcherStateCopyWith<$Res> {
  factory $CostumeImageWatcherStateCopyWith(CostumeImageWatcherState value,
          $Res Function(CostumeImageWatcherState) then) =
      _$CostumeImageWatcherStateCopyWithImpl<$Res>;
  $Res call({List<CostumeImage> images});
}

/// @nodoc
class _$CostumeImageWatcherStateCopyWithImpl<$Res>
    implements $CostumeImageWatcherStateCopyWith<$Res> {
  _$CostumeImageWatcherStateCopyWithImpl(this._value, this._then);

  final CostumeImageWatcherState _value;
  // ignore: unused_field
  final $Res Function(CostumeImageWatcherState) _then;

  @override
  $Res call({
    Object? images = freezed,
  }) {
    return _then(_value.copyWith(
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<CostumeImage>,
    ));
  }
}

/// @nodoc
abstract class _$CostumeImageWatcherStateCopyWith<$Res>
    implements $CostumeImageWatcherStateCopyWith<$Res> {
  factory _$CostumeImageWatcherStateCopyWith(_CostumeImageWatcherState value,
          $Res Function(_CostumeImageWatcherState) then) =
      __$CostumeImageWatcherStateCopyWithImpl<$Res>;
  @override
  $Res call({List<CostumeImage> images});
}

/// @nodoc
class __$CostumeImageWatcherStateCopyWithImpl<$Res>
    extends _$CostumeImageWatcherStateCopyWithImpl<$Res>
    implements _$CostumeImageWatcherStateCopyWith<$Res> {
  __$CostumeImageWatcherStateCopyWithImpl(_CostumeImageWatcherState _value,
      $Res Function(_CostumeImageWatcherState) _then)
      : super(_value, (v) => _then(v as _CostumeImageWatcherState));

  @override
  _CostumeImageWatcherState get _value =>
      super._value as _CostumeImageWatcherState;

  @override
  $Res call({
    Object? images = freezed,
  }) {
    return _then(_CostumeImageWatcherState(
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<CostumeImage>,
    ));
  }
}

/// @nodoc

class _$_CostumeImageWatcherState implements _CostumeImageWatcherState {
  const _$_CostumeImageWatcherState({required this.images});

  @override
  final List<CostumeImage> images;

  @override
  String toString() {
    return 'CostumeImageWatcherState(images: $images)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CostumeImageWatcherState &&
            (identical(other.images, images) ||
                const DeepCollectionEquality().equals(other.images, images)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(images);

  @JsonKey(ignore: true)
  @override
  _$CostumeImageWatcherStateCopyWith<_CostumeImageWatcherState> get copyWith =>
      __$CostumeImageWatcherStateCopyWithImpl<_CostumeImageWatcherState>(
          this, _$identity);
}

abstract class _CostumeImageWatcherState implements CostumeImageWatcherState {
  const factory _CostumeImageWatcherState(
      {required List<CostumeImage> images}) = _$_CostumeImageWatcherState;

  @override
  List<CostumeImage> get images => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CostumeImageWatcherStateCopyWith<_CostumeImageWatcherState> get copyWith =>
      throw _privateConstructorUsedError;
}
