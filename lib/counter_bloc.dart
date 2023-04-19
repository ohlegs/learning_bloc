import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterEvent {}

class CounterIncrementPressed extends CounterEvent {}

class CounterDicrementPressed extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, List> {
  CounterBloc() : super([]) {
    on<CounterIncrementPressed>((event, emit) {
      emit([...state, Random().nextInt(10)]);
    });
    on<CounterDicrementPressed>((event, emit) {
      emit(state.sublist(0, state.length - 1));
    });
  }
}
