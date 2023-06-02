import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:learning_bloc/model/list_item_model.dart';

const String BOX_TASKS = "tasks";
const String KEY_TASK_LIST = 'taskList';

class DBController {
  Future<List<ItemListModel>> getTask() async {
    List<ItemListModel> getTasks = [];
    final box = await Hive.openBox(BOX_TASKS);
    print(box.values);
    if (box.isNotEmpty) {
      final List<ItemListModel> jsonString =
          box.values.toList().cast<ItemListModel>();
      getTasks = jsonString;
      print('\x1B[33m${jsonString.length}\x1B[0m');
    }
    box.close();
    return getTasks;
  }

  static addTask({required ItemListModel newListTask}) async {
    final box = await Hive.openBox(BOX_TASKS);
    await box.add(newListTask);
    print(box.values.length);
  }

  removeTask() async {
    final box = await Hive.openBox(BOX_TASKS);
  }

  updateTask() async {
    final box = await Hive.openBox(BOX_TASKS);
  }
}
