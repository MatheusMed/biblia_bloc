// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_books_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AllBooksEntityAdapter extends TypeAdapter<AllBooksEntity> {
  @override
  final int typeId = 2;

  @override
  AllBooksEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AllBooksEntity(
      abbrev: fields[0] as AbbrevEntity?,
      author: fields[1] as String?,
      chapters: fields[2] as int?,
      group: fields[3] as String?,
      name: fields[4] as String?,
      testament: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AllBooksEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.abbrev)
      ..writeByte(1)
      ..write(obj.author)
      ..writeByte(2)
      ..write(obj.chapters)
      ..writeByte(3)
      ..write(obj.group)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.testament);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllBooksEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
