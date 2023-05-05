part of 'counter_bloc.dart';

@immutable
abstract class ListEvent {}

class ListAdd extends ListEvent {}

class ListRemove extends ListEvent {}
