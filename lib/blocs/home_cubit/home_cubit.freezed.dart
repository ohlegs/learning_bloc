// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeCubitState {
  Map<int, String> get productItems => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<int, String> productItems) init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<int, String> productItems)? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<int, String> productItems)? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitHomeCubitState value) init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitHomeCubitState value)? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitHomeCubitState value)? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeCubitStateCopyWith<HomeCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeCubitStateCopyWith<$Res> {
  factory $HomeCubitStateCopyWith(
          HomeCubitState value, $Res Function(HomeCubitState) then) =
      _$HomeCubitStateCopyWithImpl<$Res, HomeCubitState>;
  @useResult
  $Res call({Map<int, String> productItems});
}

/// @nodoc
class _$HomeCubitStateCopyWithImpl<$Res, $Val extends HomeCubitState>
    implements $HomeCubitStateCopyWith<$Res> {
  _$HomeCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productItems = null,
  }) {
    return _then(_value.copyWith(
      productItems: null == productItems
          ? _value.productItems
          : productItems // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitHomeCubitStateCopyWith<$Res>
    implements $HomeCubitStateCopyWith<$Res> {
  factory _$$InitHomeCubitStateCopyWith(_$InitHomeCubitState value,
          $Res Function(_$InitHomeCubitState) then) =
      __$$InitHomeCubitStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<int, String> productItems});
}

/// @nodoc
class __$$InitHomeCubitStateCopyWithImpl<$Res>
    extends _$HomeCubitStateCopyWithImpl<$Res, _$InitHomeCubitState>
    implements _$$InitHomeCubitStateCopyWith<$Res> {
  __$$InitHomeCubitStateCopyWithImpl(
      _$InitHomeCubitState _value, $Res Function(_$InitHomeCubitState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productItems = null,
  }) {
    return _then(_$InitHomeCubitState(
      productItems: null == productItems
          ? _value._productItems
          : productItems // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
    ));
  }
}

/// @nodoc

class _$InitHomeCubitState implements InitHomeCubitState {
  const _$InitHomeCubitState({required final Map<int, String> productItems})
      : _productItems = productItems;

  final Map<int, String> _productItems;
  @override
  Map<int, String> get productItems {
    if (_productItems is EqualUnmodifiableMapView) return _productItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_productItems);
  }

  @override
  String toString() {
    return 'HomeCubitState.init(productItems: $productItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitHomeCubitState &&
            const DeepCollectionEquality()
                .equals(other._productItems, _productItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_productItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitHomeCubitStateCopyWith<_$InitHomeCubitState> get copyWith =>
      __$$InitHomeCubitStateCopyWithImpl<_$InitHomeCubitState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<int, String> productItems) init,
  }) {
    return init(productItems);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<int, String> productItems)? init,
  }) {
    return init?.call(productItems);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<int, String> productItems)? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(productItems);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitHomeCubitState value) init,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InitHomeCubitState value)? init,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitHomeCubitState value)? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class InitHomeCubitState implements HomeCubitState {
  const factory InitHomeCubitState(
      {required final Map<int, String> productItems}) = _$InitHomeCubitState;

  @override
  Map<int, String> get productItems;
  @override
  @JsonKey(ignore: true)
  _$$InitHomeCubitStateCopyWith<_$InitHomeCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}
