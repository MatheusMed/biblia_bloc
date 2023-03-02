import 'package:hive/hive.dart';
part 'abbrev_entity.g.dart';

@HiveType(typeId: 1)
class AbbrevEntity {
  @HiveField(0)
  final String? pt;
  @HiveField(1)
  final String? en;
  AbbrevEntity({
    this.pt,
    this.en,
  });

  @override
  String toString() => 'AbbrevEntity(pt: $pt, en: $en)';
}
