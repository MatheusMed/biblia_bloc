// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abbrev_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AbbrevEntityAdapter extends TypeAdapter<AbbrevEntity> {
  @override
  final int typeId = 1;

  @override
  AbbrevEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AbbrevEntity(
      pt: fields[0] as String?,
      en: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AbbrevEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.pt)
      ..writeByte(1)
      ..write(obj.en);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AbbrevEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
