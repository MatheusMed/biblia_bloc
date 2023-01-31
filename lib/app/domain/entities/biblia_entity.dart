import 'package:biblia_bloc/app/domain/entities/verses_entity.dart';

import 'book_entity.dart';
import 'chapter_entity.dart';

class BibliaEntity {
  int? id;
  BookEntity? book;
  ChapterEntity? chapter;
  List<VersesEntity>? verses;

  BibliaEntity({
    this.book,
    this.id,
    this.chapter,
    this.verses,
  });
}
