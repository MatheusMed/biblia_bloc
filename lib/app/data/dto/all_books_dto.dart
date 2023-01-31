import 'dart:convert';

import '../../domain/entities/entities.dart';
import 'dto.dart';

extension AllBooksDto on AllBooksEntity {
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'abbrev': abbrev?.toMap(),
      'author': author,
      'chapters': chapters,
      'group': group,
      'name': name,
      'testament': testament,
    };
  }

  static AllBooksEntity fromMap(Map<String, dynamic> map) {
    return AllBooksEntity(
      abbrev: map['abbrev'] != null
          ? AbbrevDto.fromMap(map['abbrev'] as Map<String, dynamic>)
          : null,
      author: map['author'] != null ? map['author'] as String : null,
      chapters: map['chapters'] != null ? map['chapters'] as int : null,
      group: map['group'] != null ? map['group'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      testament: map['testament'] != null ? map['testament'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  static AllBooksEntity fromJson(String source) =>
      AllBooksDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
