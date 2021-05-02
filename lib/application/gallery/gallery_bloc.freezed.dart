// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'gallery_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GalleryEventTearOff {
  const _$GalleryEventTearOff();

  PerformQuery performQuery(CostumeQuery query) {
    return PerformQuery(
      query,
    );
  }

  SelectCostumeForDisplay selectCostumeForDisplay(Costume selected) {
    return SelectCostumeForDisplay(
      selected,
    );
  }
}

/// @nodoc
const $GalleryEvent = _$GalleryEventTearOff();

/// @nodoc
mixin _$GalleryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CostumeQuery query) performQuery,
    required TResult Function(Costume selected) selectCostumeForDisplay,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CostumeQuery query)? performQuery,
    TResult Function(Costume selected)? selectCostumeForDisplay,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PerformQuery value) performQuery,
    required TResult Function(SelectCostumeForDisplay value)
        selectCostumeForDisplay,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PerformQuery value)? performQuery,
    TResult Function(SelectCostumeForDisplay value)? selectCostumeForDisplay,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryEventCopyWith<$Res> {
  factory $GalleryEventCopyWith(
          GalleryEvent value, $Res Function(GalleryEvent) then) =
      _$GalleryEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$GalleryEventCopyWithImpl<$Res> implements $GalleryEventCopyWith<$Res> {
  _$GalleryEventCopyWithImpl(this._value, this._then);

  final GalleryEvent _value;

  // ignore: unused_field
  final $Res Function(GalleryEvent) _then;
}

/// @nodoc
abstract class $PerformQueryCopyWith<$Res> {
  factory $PerformQueryCopyWith(
          PerformQuery value, $Res Function(PerformQuery) then) =
      _$PerformQueryCopyWithImpl<$Res>;

  $Res call({CostumeQuery query});

  $CostumeQueryCopyWith<$Res> get query;
}

/// @nodoc
class _$PerformQueryCopyWithImpl<$Res> extends _$GalleryEventCopyWithImpl<$Res>
    implements $PerformQueryCopyWith<$Res> {
  _$PerformQueryCopyWithImpl(
      PerformQuery _value, $Res Function(PerformQuery) _then)
      : super(_value, (v) => _then(v as PerformQuery));

  @override
  PerformQuery get _value => super._value as PerformQuery;

  @override
  $Res call({
    Object? query = freezed,
  }) {
    return _then(PerformQuery(
      query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as CostumeQuery,
    ));
  }

  @override
  $CostumeQueryCopyWith<$Res> get query {
    return $CostumeQueryCopyWith<$Res>(_value.query, (value) {
      return _then(_value.copyWith(query: value));
    });
  }
}

/// @nodoc

class _$PerformQuery implements PerformQuery {
  const _$PerformQuery(this.query);

  @override
  final CostumeQuery query;

  @override
  String toString() {
    return 'GalleryEvent.performQuery(query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PerformQuery &&
            (identical(other.query, query) ||
                const DeepCollectionEquality().equals(other.query, query)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(query);

  @JsonKey(ignore: true)
  @override
  $PerformQueryCopyWith<PerformQuery> get copyWith =>
      _$PerformQueryCopyWithImpl<PerformQuery>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CostumeQuery query) performQuery,
    required TResult Function(Costume selected) selectCostumeForDisplay,
  }) {
    return performQuery(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CostumeQuery query)? performQuery,
    TResult Function(Costume selected)? selectCostumeForDisplay,
    required TResult orElse(),
  }) {
    if (performQuery != null) {
      return performQuery(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PerformQuery value) performQuery,
    required TResult Function(SelectCostumeForDisplay value)
        selectCostumeForDisplay,
  }) {
    return performQuery(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PerformQuery value)? performQuery,
    TResult Function(SelectCostumeForDisplay value)? selectCostumeForDisplay,
    required TResult orElse(),
  }) {
    if (performQuery != null) {
      return performQuery(this);
    }
    return orElse();
  }
}

abstract class PerformQuery implements GalleryEvent {
  const factory PerformQuery(CostumeQuery query) = _$PerformQuery;

  CostumeQuery get query => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PerformQueryCopyWith<PerformQuery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectCostumeForDisplayCopyWith<$Res> {
  factory $SelectCostumeForDisplayCopyWith(SelectCostumeForDisplay value,
          $Res Function(SelectCostumeForDisplay) then) =
      _$SelectCostumeForDisplayCopyWithImpl<$Res>;

  $Res call({Costume selected});
}

/// @nodoc
class _$SelectCostumeForDisplayCopyWithImpl<$Res>
    extends _$GalleryEventCopyWithImpl<$Res>
    implements $SelectCostumeForDisplayCopyWith<$Res> {
  _$SelectCostumeForDisplayCopyWithImpl(SelectCostumeForDisplay _value,
      $Res Function(SelectCostumeForDisplay) _then)
      : super(_value, (v) => _then(v as SelectCostumeForDisplay));

  @override
  SelectCostumeForDisplay get _value => super._value as SelectCostumeForDisplay;

  @override
  $Res call({
    Object? selected = freezed,
  }) {
    return _then(SelectCostumeForDisplay(
      selected == freezed
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as Costume,
    ));
  }
}

/// @nodoc

class _$SelectCostumeForDisplay implements SelectCostumeForDisplay {
  const _$SelectCostumeForDisplay(this.selected);

  @override
  final Costume selected;

  @override
  String toString() {
    return 'GalleryEvent.selectCostumeForDisplay(selected: $selected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SelectCostumeForDisplay &&
            (identical(other.selected, selected) ||
                const DeepCollectionEquality()
                    .equals(other.selected, selected)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(selected);

  @JsonKey(ignore: true)
  @override
  $SelectCostumeForDisplayCopyWith<SelectCostumeForDisplay> get copyWith =>
      _$SelectCostumeForDisplayCopyWithImpl<SelectCostumeForDisplay>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CostumeQuery query) performQuery,
    required TResult Function(Costume selected) selectCostumeForDisplay,
  }) {
    return selectCostumeForDisplay(selected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CostumeQuery query)? performQuery,
    TResult Function(Costume selected)? selectCostumeForDisplay,
    required TResult orElse(),
  }) {
    if (selectCostumeForDisplay != null) {
      return selectCostumeForDisplay(selected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PerformQuery value) performQuery,
    required TResult Function(SelectCostumeForDisplay value)
        selectCostumeForDisplay,
  }) {
    return selectCostumeForDisplay(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PerformQuery value)? performQuery,
    TResult Function(SelectCostumeForDisplay value)? selectCostumeForDisplay,
    required TResult orElse(),
  }) {
    if (selectCostumeForDisplay != null) {
      return selectCostumeForDisplay(this);
    }
    return orElse();
  }
}

abstract class SelectCostumeForDisplay implements GalleryEvent {
  const factory SelectCostumeForDisplay(Costume selected) =
      _$SelectCostumeForDisplay;

  Costume get selected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectCostumeForDisplayCopyWith<SelectCostumeForDisplay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$GalleryStateTearOff {
  const _$GalleryStateTearOff();

  _GalleryState call({List<Costume>? costumes, Costume? selected}) {
    return _GalleryState(
      costumes: costumes,
      selected: selected,
    );
  }
}

/// @nodoc
const $GalleryState = _$GalleryStateTearOff();

/// @nodoc
mixin _$GalleryState {
  List<Costume>? get costumes => throw _privateConstructorUsedError;

  Costume? get selected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GalleryStateCopyWith<GalleryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryStateCopyWith<$Res> {
  factory $GalleryStateCopyWith(
          GalleryState value, $Res Function(GalleryState) then) =
      _$GalleryStateCopyWithImpl<$Res>;

  $Res call({List<Costume>? costumes, Costume? selected});
}

/// @nodoc
class _$GalleryStateCopyWithImpl<$Res> implements $GalleryStateCopyWith<$Res> {
  _$GalleryStateCopyWithImpl(this._value, this._then);

  final GalleryState _value;

  // ignore: unused_field
  final $Res Function(GalleryState) _then;

  @override
  $Res call({
    Object? costumes = freezed,
    Object? selected = freezed,
  }) {
    return _then(_value.copyWith(
      costumes: costumes == freezed
          ? _value.costumes
          : costumes // ignore: cast_nullable_to_non_nullable
              as List<Costume>?,
      selected: selected == freezed
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as Costume?,
    ));
  }
}

/// @nodoc
abstract class _$GalleryStateCopyWith<$Res>
    implements $GalleryStateCopyWith<$Res> {
  factory _$GalleryStateCopyWith(
          _GalleryState value, $Res Function(_GalleryState) then) =
      __$GalleryStateCopyWithImpl<$Res>;

  @override
  $Res call({List<Costume>? costumes, Costume? selected});
}

/// @nodoc
class __$GalleryStateCopyWithImpl<$Res> extends _$GalleryStateCopyWithImpl<$Res>
    implements _$GalleryStateCopyWith<$Res> {
  __$GalleryStateCopyWithImpl(
      _GalleryState _value, $Res Function(_GalleryState) _then)
      : super(_value, (v) => _then(v as _GalleryState));

  @override
  _GalleryState get _value => super._value as _GalleryState;

  @override
  $Res call({
    Object? costumes = freezed,
    Object? selected = freezed,
  }) {
    return _then(_GalleryState(
      costumes: costumes == freezed
          ? _value.costumes
          : costumes // ignore: cast_nullable_to_non_nullable
              as List<Costume>?,
      selected: selected == freezed
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as Costume?,
    ));
  }
}

/// @nodoc

class _$_GalleryState implements _GalleryState {
  const _$_GalleryState({this.costumes, this.selected});

  @override
  final List<Costume>? costumes;
  @override
  final Costume? selected;

  @override
  String toString() {
    return 'GalleryState(costumes: $costumes, selected: $selected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GalleryState &&
            (identical(other.costumes, costumes) ||
                const DeepCollectionEquality()
                    .equals(other.costumes, costumes)) &&
            (identical(other.selected, selected) ||
                const DeepCollectionEquality()
                    .equals(other.selected, selected)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(costumes) ^
      const DeepCollectionEquality().hash(selected);

  @JsonKey(ignore: true)
  @override
  _$GalleryStateCopyWith<_GalleryState> get copyWith =>
      __$GalleryStateCopyWithImpl<_GalleryState>(this, _$identity);
}

abstract class _GalleryState implements GalleryState {
  const factory _GalleryState({List<Costume>? costumes, Costume? selected}) =
      _$_GalleryState;

  @override
  List<Costume>? get costumes => throw _privateConstructorUsedError;

  @override
  Costume? get selected => throw _privateConstructorUsedError;

  @override
  @JsonKey(ignore: true)
  _$GalleryStateCopyWith<_GalleryState> get copyWith =>
      throw _privateConstructorUsedError;
}
