// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  @override
  String toString() => 'VersesEntity(number: $number, text: $text)';
}
