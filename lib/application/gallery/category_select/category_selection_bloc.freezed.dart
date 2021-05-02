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

  CategorySelected categorySelected(String selectedCategory) {
    return CategorySelected(
      selectedCategory,
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
    required TResult Function(String selectedCategory) categorySelected,
    required TResult Function() loadCategories,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String selectedCategory)? categorySelected,
    TResult Function()? loadCategories,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategorySelected value) categorySelected,
    required TResult Function(LoadCategories value) loadCategories,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategorySelected value)? categorySelected,
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
abstract class $CategorySelectedCopyWith<$Res> {
  factory $CategorySelectedCopyWith(
          CategorySelected value, $Res Function(CategorySelected) then) =
      _$CategorySelectedCopyWithImpl<$Res>;

  $Res call({String selectedCategory});
}

/// @nodoc
class _$CategorySelectedCopyWithImpl<$Res>
    extends _$CategorySelectionEventCopyWithImpl<$Res>
    implements $CategorySelectedCopyWith<$Res> {
  _$CategorySelectedCopyWithImpl(
      CategorySelected _value, $Res Function(CategorySelected) _then)
      : super(_value, (v) => _then(v as CategorySelected));

  @override
  CategorySelected get _value => super._value as CategorySelected;

  @override
  $Res call({
    Object? selectedCategory = freezed,
  }) {
    return _then(CategorySelected(
      selectedCategory == freezed
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CategorySelected implements CategorySelected {
  const _$CategorySelected(this.selectedCategory);

  @override
  final String selectedCategory;

  @override
  String toString() {
    return 'CategorySelectionEvent.categorySelected(selectedCategory: $selectedCategory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CategorySelected &&
            (identical(other.selectedCategory, selectedCategory) ||
                const DeepCollectionEquality()
                    .equals(other.selectedCategory, selectedCategory)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(selectedCategory);

  @JsonKey(ignore: true)
  @override
  $CategorySelectedCopyWith<CategorySelected> get copyWith =>
      _$CategorySelectedCopyWithImpl<CategorySelected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String selectedCategory) categorySelected,
    required TResult Function() loadCategories,
  }) {
    return categorySelected(selectedCategory);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String selectedCategory)? categorySelected,
    TResult Function()? loadCategories,
    required TResult orElse(),
  }) {
    if (categorySelected != null) {
      return categorySelected(selectedCategory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CategorySelected value) categorySelected,
    required TResult Function(LoadCategories value) loadCategories,
  }) {
    return categorySelected(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategorySelected value)? categorySelected,
    TResult Function(LoadCategories value)? loadCategories,
    required TResult orElse(),
  }) {
    if (categorySelected != null) {
      return categorySelected(this);
    }
    return orElse();
  }
}

abstract class CategorySelected implements CategorySelectionEvent {
  const factory CategorySelected(String selectedCategory) = _$CategorySelected;

  String get selectedCategory => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategorySelectedCopyWith<CategorySelected> get copyWith =>
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
    required TResult Function(String selectedCategory) categorySelected,
    required TResult Function() loadCategories,
  }) {
    return loadCategories();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String selectedCategory)? categorySelected,
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
    required TResult Function(CategorySelected value) categorySelected,
    required TResult Function(LoadCategories value) loadCategories,
  }) {
    return loadCategories(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CategorySelected value)? categorySelected,
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
      {required bool loading, required List<String> categories}) {
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

  List<String> get categories => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategorySelectionStateCopyWith<CategorySelectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategorySelectionStateCopyWith<$Res> {
  factory $CategorySelectionStateCopyWith(CategorySelectionState value,
          $Res Function(CategorySelectionState) then) =
      _$CategorySelectionStateCopyWithImpl<$Res>;

  $Res call({bool loading, List<String> categories});
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
              as List<String>,
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
  $Res call({bool loading, List<String> categories});
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
              as List<String>,
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
  final List<String> categories;

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
      required List<String> categories}) = _$_CategorySelectionState;

  @override
  bool get loading => throw _privateConstructorUsedError;

  @override
  List<String> get categories => throw _privateConstructorUsedError;

  @override
  @JsonKey(ignore: true)
  _$CategorySelectionStateCopyWith<_CategorySelectionState> get copyWith =>
      throw _privateConstructorUsedError;
}
