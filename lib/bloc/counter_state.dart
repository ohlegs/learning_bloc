part of 'counter_bloc.dart';

@immutable
class CounterBlocState {
  List<num> counter = [];
  CounterBlocState({
    required this.counter,
  });
}

class CounterInitial extends CounterBlocState {
  CounterInitial() : super(counter: []);
}

class IncrementState extends CounterBlocState {
  IncrementState(List<num> increment) : super(counter: increment);
}

class DecrementState extends CounterBlocState {
  DecrementState(List<num> increment) : super(counter: increment);
}
