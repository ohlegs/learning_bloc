import 'package:hive/hive.dart';
part 'list_item_model.g.dart';

@HiveType(typeId: 0)
class ItemListModel {
  @HiveField(0)
  late String? nameTask;
  @HiveField(1)
  final String? descriptionTask;
  @HiveField(2)
  final String? selectedTime;
  @HiveField(3)
  final String? createDate;
  @HiveField(4)
  final num? colorTask;
  @HiveField(5)
  final String? complitedTime;
  ItemListModel(
      {this.nameTask,
      this.descriptionTask,
      this.selectedTime,
      this.colorTask,
      this.createDate,
      this.complitedTime});
}
