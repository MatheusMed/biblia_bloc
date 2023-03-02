import 'package:biblia_bloc/app/domain/usecases/get_all_books_usecases.dart';
import 'package:biblia_bloc/app/presenter/home/bloc/home_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class HomeBloc extends Cubit<HomeState> {
  final IGetAllBooksUsecases _getAllBooksUsecases;
  HomeBloc(this._getAllBooksUsecases) : super(HomeState());

  getAllLivros() async {
    emit(state.copyWith(homeStatus: HomeStatus.loading));
    final response = await _getAllBooksUsecases();
    response.fold(
      (error) => debugPrint(error.toString()),
      (sucess) async {
        emit(
          state.copyWith(homeStatus: HomeStatus.sucess, listaLivrros: sucess),
        );
      },
    );
  }
}
