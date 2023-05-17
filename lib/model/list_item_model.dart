class ItemListModel {
  final String nameTask;
  final String descriptionTask;
  final String selectedDate;
  final String selectedTime;
  final String createDate;
  final num colorTask;
  ItemListModel(
      {required this.nameTask,
      required this.descriptionTask,
      required this.selectedDate,
      required this.selectedTime,
      required this.colorTask,
      required this.createDate});

  factory ItemListModel.fromJson(Map<String, dynamic> json) {
    print("json $json");
    return ItemListModel(
        nameTask: json['nameTask'] as String,
        descriptionTask: json['descriptionTask'] as String,
        selectedDate: json['selectedDate'] as String,
        selectedTime: json['selectedTime'] as String,
        colorTask: json['colorTask'] as num,
        createDate: json['createDate'] as String);
  }

  Map<String, dynamic> toJson() => {
        'nameTask': nameTask,
        'descriptionTask': descriptionTask,
        'selectedDate': selectedDate,
        'selectedTime': selectedTime,
        'colorTask': colorTask,
        'createDate': createDate,
        'dateStart': createDate
      };
}
