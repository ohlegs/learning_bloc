part of 'counter_bloc.dart';

@immutable
class ListBlocState {
  List<ItemListModel> list = [];
  ListBlocState({
    required this.list,
  });
}

class CounterInitial extends ListBlocState {
  CounterInitial() : super(list: []);
}

class AddNewState extends ListBlocState {
  AddNewState(List<ItemListModel> increment) : super(list: increment);
}

class DecrementState extends ListBlocState {
  DecrementState(List<ItemListModel> increment) : super(list: increment);
}
