class ItemListModel {
  final String nameTask;
  final String descriptionTask;
  final String selectedTime;
  final String createDate;
  final num colorTask;
  final String complitedTime;
  ItemListModel(
      {required this.nameTask,
      required this.descriptionTask,
      required this.selectedTime,
      required this.colorTask,
      required this.createDate,
      required this.complitedTime});

  factory ItemListModel.fromJson(Map<String, dynamic> json) {
    return ItemListModel(
        nameTask: json['nameTask'] as String,
        descriptionTask: json['descriptionTask'] as String,
        selectedTime: json['selectedTime'] as String,
        colorTask: json['colorTask'] as num,
        createDate: json['createDate'] as String,
        complitedTime:
            json['complitedTime'] != null && json['complitedTime'] != ""
                ? json['complitedTime']
                : null.toString());
  }

  Map<String, dynamic> toJson() => {
        'nameTask': nameTask,
        'descriptionTask': descriptionTask,
        'selectedTime': selectedTime,
        'colorTask': colorTask,
        'createDate': createDate,
        'dateStart': createDate
      };
}
