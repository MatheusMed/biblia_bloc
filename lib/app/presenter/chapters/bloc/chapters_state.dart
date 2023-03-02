// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../domain/entities/biblia_entity.dart';
import '../../../domain/entities/verses_entity.dart';

enum ChaptersStatus { initial, loading, sucess, error }

class ChaptersState {
  final List<VersesEntity>? listVerser;
  final ChaptersStatus status;

  ChaptersState({
    this.listVerser,
    this.status = ChaptersStatus.initial,
  });

  ChaptersState copyWith({
    List<VersesEntity>? listVerser,
    ChaptersStatus? status,
  }) {
    return ChaptersState(
      listVerser: listVerser ?? this.listVerser,
      status: status ?? this.status,
    );
  }
}
