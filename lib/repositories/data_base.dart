import 'package:hive/hive.dart';

class DBController {
  final String nameBox;
  late Box<String> box;

  DBController({this.nameBox = "tasks"}) {
    _openBox();
  }

  _openBox() async {
    this.box = await Hive.openBox("tasks");
  }

  getTask() {}
  addTask() {}
  removeTask() {}
  updateTask() {}
}
