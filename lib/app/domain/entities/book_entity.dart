import 'abbrev_entity.dart';
import 'package:hive/hive.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 4)
class BookEntity {
  @HiveField(0)
  AbbrevEntity? abbrev;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? author;
  @HiveField(3)
  String? group;
  @HiveField(4)
  String? version;

  BookEntity({
    this.abbrev,
    this.name,
    this.author,
    this.group,
    this.version,
  });
}
