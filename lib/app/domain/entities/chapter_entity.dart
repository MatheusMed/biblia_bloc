import 'package:hive/hive.dart';
part 'chapter_entity.g.dart';

@HiveType(typeId: 5)
class ChapterEntity {
  @HiveField(0)
  int? number;
  @HiveField(1)
  int? verses;
  ChapterEntity({
    this.number,
    this.verses,
  });
}
