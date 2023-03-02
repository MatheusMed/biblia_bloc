import 'package:hive/hive.dart';

import 'abbrev_entity.dart';
part 'all_books_entity.g.dart';

@HiveType(typeId: 2)
class AllBooksEntity {
  @HiveField(0)
  AbbrevEntity? abbrev;
  @HiveField(1)
  String? author;
  @HiveField(2)
  int? chapters;
  @HiveField(3)
  String? group;
  @HiveField(4)
  String? name;
  @HiveField(5)
  String? testament;

  AllBooksEntity({
    this.abbrev,
    this.author,
    this.chapters,
    this.group,
    this.name,
    this.testament,
  });

  @override
  String toString() =>
      "AllBooksEntity(abbrev: $abbrev,author: $author,chapters: $chapters,group: $group,name: $name,testament: $testament) ";
}
