import 'abbrev_entity.dart';

class BookEntity {
  AbbrevEntity? abbrev;
  String? name;
  String? author;
  String? group;
  String? version;
  BookEntity({
    this.abbrev,
    this.name,
    this.author,
    this.group,
    this.version,
  });
}
