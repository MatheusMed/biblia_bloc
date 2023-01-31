import 'package:biblia_bloc/app/data/datasource/get_all_books_datasource.dart';
import 'package:biblia_bloc/app/data/datasource/remote/get_all_books_remote.dart';
import 'package:biblia_bloc/app/data/repositories/implementations/get_all_books_data_repository.dart';
import 'package:biblia_bloc/app/domain/repositories/get_all_books_repository.dart';
import 'package:biblia_bloc/app/domain/usecases/get_all_books_usecases.dart';
import 'package:biblia_bloc/app/domain/usecases/implementations/get_all_books_usecase_imp.dart';
import 'package:biblia_bloc/app/presenter/chapters/bloc/chapters_bloc.dart';
import 'package:biblia_bloc/app/presenter/home/bloc/home_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class Injector {
  static void init() {
    final injector = GetIt.instance;

    //controllers
    injector.registerFactory<HomeBloc>(() => HomeBloc(injector.get()));
    injector.registerFactory<ChaptersBloc>(() => ChaptersBloc(injector.get()));

    // Usecases
    injector.registerLazySingleton<IGetAllBooksUsecases>(
        () => GetAllBooksUsecasesImp(injector.get()));

    // repository
    injector.registerLazySingleton<IGetAllBooksRepository>(
        () => GetAllBooksDataRepositoryImp(injector()));
    // datasource
    injector.registerLazySingleton<IGetAllBooksDatasource>(
        () => GetAllBooksRemoteImp(injector()));
    //
    injector.registerFactory<Dio>(() => Dio());
  }
}
