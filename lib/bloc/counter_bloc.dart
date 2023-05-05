import 'dart:ffi';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:meta/meta.dart';
part 'counter_event.dart';
part 'counter_state.dart';

class ListBloc extends Bloc<ListEvent, CounterBlocState> {
  ListBloc() : super(CounterInitial()) {
    on<ListAdd>((event, emit) {
      emit(IncrementState([...state.counter,state.counter.length ])); // add 5 to the counter value
    });
  }
}
