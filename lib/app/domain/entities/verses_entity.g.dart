// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verses_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VersesEntityAdapter extends TypeAdapter<VersesEntity> {
  @override
  final int typeId = 6;

  @override
  VersesEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VersesEntity(
      number: fields[0] as int?,
      text: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, VersesEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VersesEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
