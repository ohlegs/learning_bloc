// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemListModelAdapter extends TypeAdapter<ItemListModel> {
  @override
  final int typeId = 0;

  @override
  ItemListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemListModel(
      nameTask: fields[0] as String?,
      descriptionTask: fields[1] as String?,
      selectedTime: fields[2] as String?,
      colorTask: fields[4] as num?,
      createDate: fields[3] as String?,
      complitedTime: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ItemListModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.nameTask)
      ..writeByte(1)
      ..write(obj.descriptionTask)
      ..writeByte(2)
      ..write(obj.selectedTime)
      ..writeByte(3)
      ..write(obj.createDate)
      ..writeByte(4)
      ..write(obj.colorTask)
      ..writeByte(5)
      ..write(obj.complitedTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
