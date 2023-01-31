import 'dart:convert';

import '../../domain/entities/entities.dart';

extension VersesDto on VersesEntity {
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'number': number,
      'text': text,
    };
  }

  static VersesEntity fromMap(Map<String, dynamic> map) {
    return VersesEntity(
      number: map['number'] != null ? map['number'] as int : null,
      text: map['text'] != null ? map['text'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  static VersesEntity fromJson(String source) =>
      VersesDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
