import 'dart:convert';

import '../../domain/entities/entities.dart';
import 'dto.dart';

extension BookDto on BookEntity {
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'abbrev': abbrev?.toMap(),
      'name': name,
      'author': author,
      'group': group,
      'version': version,
    };
  }

  static BookEntity fromMap(Map<String, dynamic> map) {
    return BookEntity(
      abbrev: map['abbrev'] != null
          ? AbbrevDto.fromMap(map['abbrev'] as Map<String, dynamic>)
          : null,
      name: map['name'] != null ? map['name'] as String : null,
      author: map['author'] != null ? map['author'] as String : null,
      group: map['group'] != null ? map['group'] as String : null,
      version: map['version'] != null ? map['version'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  static BookEntity fromJson(String source) =>
      BookDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
