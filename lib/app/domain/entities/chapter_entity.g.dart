// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChapterEntityAdapter extends TypeAdapter<ChapterEntity> {
  @override
  final int typeId = 5;

  @override
  ChapterEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChapterEntity(
      number: fields[0] as int?,
      verses: fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ChapterEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.verses);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChapterEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
