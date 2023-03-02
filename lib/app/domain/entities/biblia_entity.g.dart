// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biblia_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BibliaEntityAdapter extends TypeAdapter<BibliaEntity> {
  @override
  final int typeId = 3;

  @override
  BibliaEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BibliaEntity(
      book: fields[1] as BookEntity?,
      id: fields[0] as int?,
      chapter: fields[2] as ChapterEntity?,
      verses: (fields[3] as List?)?.cast<VersesEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, BibliaEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.book)
      ..writeByte(2)
      ..write(obj.chapter)
      ..writeByte(3)
      ..write(obj.verses);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BibliaEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
