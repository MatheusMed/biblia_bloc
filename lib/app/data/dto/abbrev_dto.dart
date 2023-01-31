import 'dart:convert';

import '../../domain/entities/abbrev_entity.dart';

extension AbbrevDto on AbbrevEntity {
  static AbbrevEntity fromMap(Map<String, dynamic> map) {
    return AbbrevEntity(
      pt: map['pt'] != null ? map['pt'] as String : null,
      en: map['en'] != null ? map['en'] as String : null,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pt': pt,
      'en': en,
    };
  }

  String toJson() => json.encode(toMap());

  static AbbrevEntity fromJson(String source) =>
      AbbrevDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
