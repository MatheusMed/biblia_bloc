import 'package:biblia_bloc/app/domain/usecases/get_all_books_usecases.dart';
import 'package:biblia_bloc/app/presenter/chapters/bloc/chapters_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChaptersBloc extends Cubit<ChaptersState> {
  final IGetAllBooksUsecases _allBooksUsecases;
  ChaptersBloc(this._allBooksUsecases) : super(ChaptersState());

  getCharpter(String abbrev, int version) async {
    try {
      emit(state.copyWith(status: ChaptersStatus.loading));
      final response = await _allBooksUsecases.getCharpter(abbrev, version);
      return response.fold(
          (error) => debugPrint(error.toString()),
          (sucess) => emit(state.copyWith(
              status: ChaptersStatus.sucess, bibliaEntity: sucess)));
    } catch (e) {
      emit(state.copyWith(status: ChaptersStatus.error));
    }
  }
}
