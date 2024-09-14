// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewsState {
  String get message => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get selectedCategory => throw _privateConstructorUsedError;
  List<Articles> get newsList => throw _privateConstructorUsedError;

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewsStateCopyWith<NewsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsStateCopyWith<$Res> {
  factory $NewsStateCopyWith(NewsState value, $Res Function(NewsState) then) =
      _$NewsStateCopyWithImpl<$Res, NewsState>;
  @useResult
  $Res call(
      {String message,
      bool isLoading,
      String selectedCategory,
      List<Articles> newsList});
}

/// @nodoc
class _$NewsStateCopyWithImpl<$Res, $Val extends NewsState>
    implements $NewsStateCopyWith<$Res> {
  _$NewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? isLoading = null,
    Object? selectedCategory = null,
    Object? newsList = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String,
      newsList: null == newsList
          ? _value.newsList
          : newsList // ignore: cast_nullable_to_non_nullable
              as List<Articles>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsStateImplCopyWith<$Res>
    implements $NewsStateCopyWith<$Res> {
  factory _$$NewsStateImplCopyWith(
          _$NewsStateImpl value, $Res Function(_$NewsStateImpl) then) =
      __$$NewsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      bool isLoading,
      String selectedCategory,
      List<Articles> newsList});
}

/// @nodoc
class __$$NewsStateImplCopyWithImpl<$Res>
    extends _$NewsStateCopyWithImpl<$Res, _$NewsStateImpl>
    implements _$$NewsStateImplCopyWith<$Res> {
  __$$NewsStateImplCopyWithImpl(
      _$NewsStateImpl _value, $Res Function(_$NewsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? isLoading = null,
    Object? selectedCategory = null,
    Object? newsList = null,
  }) {
    return _then(_$NewsStateImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String,
      newsList: null == newsList
          ? _value._newsList
          : newsList // ignore: cast_nullable_to_non_nullable
              as List<Articles>,
    ));
  }
}

/// @nodoc

class _$NewsStateImpl implements _NewsState {
  const _$NewsStateImpl(
      {required this.message,
      required this.isLoading,
      required this.selectedCategory,
      required final List<Articles> newsList})
      : _newsList = newsList;

  @override
  final String message;
  @override
  final bool isLoading;
  @override
  final String selectedCategory;
  final List<Articles> _newsList;
  @override
  List<Articles> get newsList {
    if (_newsList is EqualUnmodifiableListView) return _newsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newsList);
  }

  @override
  String toString() {
    return 'NewsState(message: $message, isLoading: $isLoading, selectedCategory: $selectedCategory, newsList: $newsList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsStateImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            const DeepCollectionEquality().equals(other._newsList, _newsList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, isLoading,
      selectedCategory, const DeepCollectionEquality().hash(_newsList));

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsStateImplCopyWith<_$NewsStateImpl> get copyWith =>
      __$$NewsStateImplCopyWithImpl<_$NewsStateImpl>(this, _$identity);
}

abstract class _NewsState implements NewsState {
  const factory _NewsState(
      {required final String message,
      required final bool isLoading,
      required final String selectedCategory,
      required final List<Articles> newsList}) = _$NewsStateImpl;

  @override
  String get message;
  @override
  bool get isLoading;
  @override
  String get selectedCategory;
  @override
  List<Articles> get newsList;

  /// Create a copy of NewsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewsStateImplCopyWith<_$NewsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
