import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:learning_bloc/model/list_item_model.dart';
import 'package:learning_bloc/repositories/data_base.dart';
part 'counter_event.dart';
part 'counter_state.dart';

class ListBloc extends Bloc<ListEvent, ListBlocState> {
  ListBloc() : super(CounterInitial()) {
    on<ListStateInit>((event, emit) {
      final List<ItemListModel> alltasks = event.taskList;
      emit(AddNewState([...alltasks]));
    });
    on<ListNewTask>((event, emit) {
      emit(AddNewState([...state.list, event.listNewTask]));
      DBController.addTask(newListTask: [...state.list]);
    });

    on<SortListBy>((event, emit) {
      print(event.hashCode);
      switch (event.typeSort) {
        case 0:
          //sort by time
          state.list.sort((a, b) => a.selectedTime.compareTo(b.selectedTime));
          break;
        case 1:
          //sort by name || alphabet
          state.list.sort((a, b) => a.nameTask.compareTo(b.nameTask));
          break;
        case 2:
          state.list.sort((a, b) => a.selectedDate.compareTo(b.selectedDate));
          break;
        case 3:
          print("progress");
          break;
        default:
          print("Unsupported sort type"); // если передано неизвестное значение
      }
      emit(AddNewState([...state.list]));
    });

    on<RemoveTask>((event, emit) {
      state.list.removeAt(event.removeByIndex);
      emit(AddNewState([...state.list]));
      DBController.addTask(newListTask: [...state.list]);
    });
  }
}
