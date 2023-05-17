part of 'counter_bloc.dart';

@immutable
abstract class ListEvent {}

class ListStateInit extends ListEvent {
  final taskList;
  ListStateInit({required this.taskList});
}

class ListNewTask extends ListEvent {
  final ItemListModel listNewTask;
  ListNewTask({required this.listNewTask});
}

class SortListBy extends ListEvent {
  final int typeSort;
  SortListBy({required this.typeSort});
}

class RemoveTask extends ListEvent {
  final int removeByIndex;
  RemoveTask({required this.removeByIndex});
}

class ListRemove extends ListEvent {}
