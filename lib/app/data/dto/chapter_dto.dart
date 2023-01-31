import 'dart:convert';

import '../../domain/entities/chapter_entity.dart';

extension ChapterDto on ChapterEntity {
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'number': number,
      'verses': verses,
    };
  }

  static ChapterEntity fromMap(Map<String, dynamic> map) {
    return ChapterEntity(
      number: map['number'] != null ? map['number'] as int : null,
      verses: map['verses'] != null ? map['verses'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  static fromJson(String source) =>
      ChapterDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
