// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../domain/entities/biblia_entity.dart';

enum ChaptersStatus { initial, loading, sucess, error }

class ChaptersState {
  final BibliaEntity? bibliaEntity;
  final ChaptersStatus status;
  final double? doubleSizeText;

  ChaptersState({
    this.bibliaEntity,
    this.doubleSizeText,
    this.status = ChaptersStatus.initial,
  });

  ChaptersState copyWith({
    BibliaEntity? bibliaEntity,
    ChaptersStatus? status,
    double? doubleSizeText,
  }) {
    return ChaptersState(
      bibliaEntity: bibliaEntity ?? this.bibliaEntity,
      status: status ?? this.status,
      doubleSizeText: doubleSizeText ?? this.doubleSizeText,
    );
  }
}
