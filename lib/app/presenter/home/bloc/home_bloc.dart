import 'package:biblia_bloc/app/core/services/storage/hive_storage.dart';
import 'package:biblia_bloc/app/domain/usecases/get_all_books_usecases.dart';
import 'package:biblia_bloc/app/presenter/home/bloc/home_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/all_books_entity.dart';
import '../../../domain/entities/biblia_entity.dart';

class HomeBloc extends Cubit<HomeState> {
  final IGetAllBooksUsecases _getAllBooksUsecases;
  final IHiveStorage _hiveStorage;
  HomeBloc(this._getAllBooksUsecases, this._hiveStorage) : super(HomeState());

  getAllLivros() async {
    emit(state.copyWith(homeStatus: HomeStatus.loading));
    final response = await _getAllBooksUsecases();
    response.fold(
      (error) => debugPrint(error.toString()),
      (sucess) async {
        getAllValues();
        emit(
          state.copyWith(homeStatus: HomeStatus.sucess, listaLivrros: sucess),
        );
      },
    );
  }

  getAllValues() async {
    List<AllBooksEntity> lista = await _hiveStorage.getLislivrros('listaOff');
    var listaInt = [];

    for (var element in lista) {
      listaInt.add(element.chapters!);
      for (var i = 0; i <= listaInt.length; i++) {
        var result =
            await _getAllBooksUsecases.getCharpter(element.abbrev!.pt!, i + 1);

        result.fold((l) => debugPrint(l.toString()), (r) async {
          await _hiveStorage.save('livroOff', r);
        });
      }
    }
  }
}
