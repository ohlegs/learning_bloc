import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:learning_bloc/model/list_item_model.dart';

const String BOX_TASKS = "tasks";
const String KEY_TASK_LIST = 'taskList';

class DBController {
  Future<List<ItemListModel>> getTask() async {
    List<ItemListModel> getTasks = [];
    final box = await Hive.openBox(BOX_TASKS);
    if (box.isNotEmpty) {
      final String jsonString = box.get(KEY_TASK_LIST) ?? '';
      final List<dynamic> jsonList = json.decode(jsonString);
      if (jsonList.isNotEmpty) {
        print(jsonList);
        getTasks = jsonList.map((e) => ItemListModel.fromJson(e)).toList();
      }
    }

    return getTasks;
  }

  static addTask({required List<ItemListModel> newListTask}) async {
    final box = await Hive.openBox(BOX_TASKS);
    box.put(KEY_TASK_LIST, json.encode(newListTask));
  }

  removeTask() async {
    final box = await Hive.openBox(BOX_TASKS);
  }

  updateTask() async {
    final box = await Hive.openBox(BOX_TASKS);
  }
}
