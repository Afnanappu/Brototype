// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemBrandModelAdapter extends TypeAdapter<ItemBrandModel> {
  @override
  final int typeId = 1;

  @override
  ItemBrandModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemBrandModel(
      id: fields[0] as int?,
      itemBrandName: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ItemBrandModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.itemBrandName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemBrandModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ItemModelAdapter extends TypeAdapter<ItemModel> {
  @override
  final int typeId = 2;

  @override
  ItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemModel(
      id: fields[0] as int?,
      brandId: fields[2] as int,
      itemName: fields[1] as String,
      itemImage: fields[3] as String,
      itemPrice: fields[4] as double,
      color: (fields[5] as List).cast<String>(),
      ram: (fields[6] as List).cast<String>(),
      rom: (fields[7] as List).cast<String>(),
      description: fields[8] as String,
      stock: fields[9] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ItemModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.itemName)
      ..writeByte(2)
      ..write(obj.brandId)
      ..writeByte(3)
      ..write(obj.itemImage)
      ..writeByte(4)
      ..write(obj.itemPrice)
      ..writeByte(5)
      ..write(obj.color)
      ..writeByte(6)
      ..write(obj.ram)
      ..writeByte(7)
      ..write(obj.rom)
      ..writeByte(8)
      ..write(obj.description)
      ..writeByte(9)
      ..write(obj.stock);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
