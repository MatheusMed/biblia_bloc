import 'package:hive/hive.dart';
part 'verses_entity.g.dart';

@HiveType(typeId: 6)
class VersesEntity {
  @HiveField(0)
  int? number;
  @HiveField(1)
  String? text;

  VersesEntity({
    this.number,
    this.text,
  });
}
