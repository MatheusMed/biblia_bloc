import 'dart:convert';

import '../../domain/entities/entities.dart';
import 'dto.dart';

extension BibliaDto on BibliaEntity {
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'book': book?.toMap(),
      'chapter': chapter?.toMap(),
      'verses': verses?.map((x) => x.toMap()).toList(),
    };
  }

  static BibliaEntity fromMap(Map<String, dynamic> map) {
    return BibliaEntity(
      book: map['book'] != null
          ? BookDto.fromMap(map['book'] as Map<String, dynamic>)
          : null,
      chapter: map['chapter'] != null
          ? ChapterDto.fromMap(map['chapter'] as Map<String, dynamic>)
          : null,
      verses: map['verses'] != null
          ? List<VersesEntity>.from(
              (map['verses'] as List).map<VersesEntity?>(
                (x) => VersesDto.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  static BibliaEntity fromJson(String source) =>
      BibliaDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
