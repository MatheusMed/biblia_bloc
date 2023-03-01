import 'package:biblia_bloc/app/core/services/storage/storage.dart';
import 'package:biblia_bloc/app/domain/usecases/get_all_books_usecases.dart';
import 'package:biblia_bloc/app/presenter/chapters/bloc/chapters_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum SizeText {
  diminuir,
  aumentar,
}

class ChaptersBloc extends Cubit<ChaptersState> {
  final IGetAllBooksUsecases _allBooksUsecases;
  final IStorage _iStorage;
  ChaptersBloc(this._allBooksUsecases, this._iStorage) : super(ChaptersState());

  final size = ValueNotifier<double>(16);

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

  changeSizeText(SizeText sizeText) async {
    if (sizeText == SizeText.aumentar) {
      size.value++;
      if (size.value == 22.0) {
        size.value = 16.0;
      }
    } else if (sizeText == SizeText.diminuir) {
      size.value--;
      if (size.value == 12.0) {
        size.value = 16.0;
      }
    }
    await _iStorage.setValorDouble('valorText', size.value);
  }

  getValues() async {
    var result = await _iStorage.getValorDouble('valorText');
    if (result != null) {
      size.value = result;
    } else {
      size.value = 16.0;
    }
  }
}
