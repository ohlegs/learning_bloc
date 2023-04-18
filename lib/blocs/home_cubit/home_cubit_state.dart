part of 'home_cubit.dart';

@freezed
class HomeCubitState with _$HomeCubitState {
  const factory HomeCubitState.init({required Map<int, String> productItems}) =
      InitHomeCubitState;
}
