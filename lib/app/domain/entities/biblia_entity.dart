import 'package:biblia_bloc/app/domain/entities/verses_entity.dart';

import 'book_entity.dart';
import 'chapter_entity.dart';
import 'package:hive/hive.dart';
part 'biblia_entity.g.dart';

@HiveType(typeId: 3)
class BibliaEntity {
  @HiveField(0)
  int? id;
  @HiveField(1)
  BookEntity? book;
  @HiveField(2)
  ChapterEntity? chapter;
  @HiveField(3)
  List<VersesEntity>? verses;

  BibliaEntity({
    this.book,
    this.id,
    this.chapter,
    this.verses,
  });
}
