// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'category_selection_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CategorySelectionEventTearOff {
  const _$CategorySelectionEventTearOff();

  CatagorySelected catagorySelected(CostumeCategory selected) {
    return CatagorySelected(
      selected,
    );
  }

  LoadCategories loadCategories() {
    return const LoadCategories();
  }
}

/// @nodoc
const $CategorySelectionEvent = _$CategorySelectionEventTearOff();

/// @nodoc
mixin _$CategorySelectionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CostumeCategory selected) catagorySelected,
    required TResult Function() loadCategories,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CostumeCategory selected)? catagorySelected,
    TResult Function()? loadCategories,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CatagorySelected value) catagorySelected,
    required TResult Function(LoadCategories value) loadCategories,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CatagorySelected value)? catagorySelected,
    TResult Function(LoadCategories value)? loadCategories,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategorySelectionEventCopyWith<$Res> {
  factory $CategorySelectionEventCopyWith(CategorySelectionEvent value,
          $Res Function(CategorySelectionEvent) then) =
      _$CategorySelectionEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CategorySelectionEventCopyWithImpl<$Res>
    implements $CategorySelectionEventCopyWith<$Res> {
  _$CategorySelectionEventCopyWithImpl(this._value, this._then);

  final CategorySelectionEvent _value;

  // ignore: unused_field
  final $Res Function(CategorySelectionEvent) _then;
}

/// @nodoc
abstract class $CatagorySelectedCopyWith<$Res> {
  factory $CatagorySelectedCopyWith(
          CatagorySelected value, $Res Function(CatagorySelected) then) =
      _$CatagorySelectedCopyWithImpl<$Res>;

  $Res call({CostumeCategory selected});
}

/// @nodoc
class _$CatagorySelectedCopyWithImpl<$Res>
    extends _$CategorySelectionEventCopyWithImpl<$Res>
    implements $CatagorySelectedCopyWith<$Res> {
  _$CatagorySelectedCopyWithImpl(
      CatagorySelected _value, $Res Function(CatagorySelected) _then)
      : super(_value, (v) => _then(v as CatagorySelected));

  @override
  CatagorySelected get _value => super._value as CatagorySelected;

  @override
  $Res call({
    Object? selected = freezed,
  }) {
    return _then(CatagorySelected(
      selected == freezed
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as CostumeCategory,
    ));
  }
}

/// @nodoc
class _$CatagorySelected implements CatagorySelected {
  const _$CatagorySelected(this.selected);

  @override
  final CostumeCategory selected;

  @override
  String toString() {
    return 'CategorySelectionEvent.catagorySelected(selected: $selected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CatagorySelected &&
            (identical(other.selected, selected) ||
                const DeepCollectionEquality()
                    .equals(other.selected, selected)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(selected);

  @JsonKey(ignore: true)
  @override
  $CatagorySelectedCopyWith<CatagorySelected> get copyWith =>
      _$CatagorySelectedCopyWithImpl<CatagorySelected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CostumeCategory selected) catagorySelected,
    required TResult Function() loadCategories,
  }) {
    return catagorySelected(selected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CostumeCategory selected)? catagorySelected,
    TResult Function()? loadCategories,
    required TResult orElse(),
  }) {
    if (catagorySelected != null) {
      return catagorySelected(selected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CatagorySelected value) catagorySelected,
    required TResult Function(LoadCategories value) loadCategories,
  }) {
    return catagorySelected(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CatagorySelected value)? catagorySelected,
    TResult Function(LoadCategories value)? loadCategories,
    required TResult orElse(),
  }) {
    if (catagorySelected != null) {
      return catagorySelected(this);
    }
    return orElse();
  }
}

abstract class CatagorySelected implements CategorySelectionEvent {
  const factory CatagorySelected(CostumeCategory selected) = _$CatagorySelected;

  CostumeCategory get selected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CatagorySelectedCopyWith<CatagorySelected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadCategoriesCopyWith<$Res> {
  factory $LoadCategoriesCopyWith(
          LoadCategories value, $Res Function(LoadCategories) then) =
      _$LoadCategoriesCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadCategoriesCopyWithImpl<$Res>
    extends _$CategorySelectionEventCopyWithImpl<$Res>
    implements $LoadCategoriesCopyWith<$Res> {
  _$LoadCategoriesCopyWithImpl(
      LoadCategories _value, $Res Function(LoadCategories) _then)
      : super(_value, (v) => _then(v as LoadCategories));

  @override
  LoadCategories get _value => super._value as LoadCategories;
}

/// @nodoc
class _$LoadCategories implements LoadCategories {
  const _$LoadCategories();

  @override
  String toString() {
    return 'CategorySelectionEvent.loadCategories()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LoadCategories);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CostumeCategory selected) catagorySelected,
    required TResult Function() loadCategories,
  }) {
    return loadCategories();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CostumeCategory selected)? catagorySelected,
    TResult Function()? loadCategories,
    required TResult orElse(),
  }) {
    if (loadCategories != null) {
      return loadCategories();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CatagorySelected value) catagorySelected,
    required TResult Function(LoadCategories value) loadCategories,
  }) {
    return loadCategories(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CatagorySelected value)? catagorySelected,
    TResult Function(LoadCategories value)? loadCategories,
    required TResult orElse(),
  }) {
    if (loadCategories != null) {
      return loadCategories(this);
    }
    return orElse();
  }
}

abstract class LoadCategories implements CategorySelectionEvent {
  const factory LoadCategories() = _$LoadCategories;
}

/// @nodoc
class _$CategorySelectionStateTearOff {
  const _$CategorySelectionStateTearOff();

  _CategorySelectionState call(
      {required bool loading, required List<CostumeCategory> categories}) {
    return _CategorySelectionState(
      loading: loading,
      categories: categories,
    );
  }
}

/// @nodoc
const $CategorySelectionState = _$CategorySelectionStateTearOff();

/// @nodoc
mixin _$CategorySelectionState {
  bool get loading => throw _privateConstructorUsedError;

  List<CostumeCategory> get categories => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategorySelectionStateCopyWith<CategorySelectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategorySelectionStateCopyWith<$Res> {
  factory $CategorySelectionStateCopyWith(CategorySelectionState value,
          $Res Function(CategorySelectionState) then) =
      _$CategorySelectionStateCopyWithImpl<$Res>;

  $Res call({bool loading, List<CostumeCategory> categories});
}

/// @nodoc
class _$CategorySelectionStateCopyWithImpl<$Res>
    implements $CategorySelectionStateCopyWith<$Res> {
  _$CategorySelectionStateCopyWithImpl(this._value, this._then);

  final CategorySelectionState _value;

  // ignore: unused_field
  final $Res Function(CategorySelectionState) _then;

  @override
  $Res call({
    Object? loading = freezed,
    Object? categories = freezed,
  }) {
    return _then(_value.copyWith(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CostumeCategory>,
    ));
  }
}

/// @nodoc
abstract class _$CategorySelectionStateCopyWith<$Res>
    implements $CategorySelectionStateCopyWith<$Res> {
  factory _$CategorySelectionStateCopyWith(_CategorySelectionState value,
          $Res Function(_CategorySelectionState) then) =
      __$CategorySelectionStateCopyWithImpl<$Res>;

  @override
  $Res call({bool loading, List<CostumeCategory> categories});
}

/// @nodoc
class __$CategorySelectionStateCopyWithImpl<$Res>
    extends _$CategorySelectionStateCopyWithImpl<$Res>
    implements _$CategorySelectionStateCopyWith<$Res> {
  __$CategorySelectionStateCopyWithImpl(_CategorySelectionState _value,
      $Res Function(_CategorySelectionState) _then)
      : super(_value, (v) => _then(v as _CategorySelectionState));

  @override
  _CategorySelectionState get _value => super._value as _CategorySelectionState;

  @override
  $Res call({
    Object? loading = freezed,
    Object? categories = freezed,
  }) {
    return _then(_CategorySelectionState(
      loading: loading == freezed
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CostumeCategory>,
    ));
  }
}

/// @nodoc
class _$_CategorySelectionState implements _CategorySelectionState {
  const _$_CategorySelectionState(
      {required this.loading, required this.categories});

  @override
  final bool loading;
  @override
  final List<CostumeCategory> categories;

  @override
  String toString() {
    return 'CategorySelectionState(loading: $loading, categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CategorySelectionState &&
            (identical(other.loading, loading) ||
                const DeepCollectionEquality()
                    .equals(other.loading, loading)) &&
            (identical(other.categories, categories) ||
                const DeepCollectionEquality()
                    .equals(other.categories, categories)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(loading) ^
      const DeepCollectionEquality().hash(categories);

  @JsonKey(ignore: true)
  @override
  _$CategorySelectionStateCopyWith<_CategorySelectionState> get copyWith =>
      __$CategorySelectionStateCopyWithImpl<_CategorySelectionState>(
          this, _$identity);
}

abstract class _CategorySelectionState implements CategorySelectionState {
  const factory _CategorySelectionState(
      {required bool loading,
      required List<CostumeCategory> categories}) = _$_CategorySelectionState;

  @override
  bool get loading => throw _privateConstructorUsedError;

  @override
  List<CostumeCategory> get categories => throw _privateConstructorUsedError;

  @override
  @JsonKey(ignore: true)
  _$CategorySelectionStateCopyWith<_CategorySelectionState> get copyWith =>
      throw _privateConstructorUsedError;
}
