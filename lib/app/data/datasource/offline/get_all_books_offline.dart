// ignore_for_file: unnecessary_cast

import 'package:biblia_bloc/app/core/services/storage/hive_storage.dart';
import 'package:biblia_bloc/app/data/datasource/offline/get_all_books_datasource_offline.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

import '../../../domain/entities/all_books_entity.dart';
import '../get_all_books_datasource.dart';

class GetAllBooksOfflineDecoratorImp
    extends GetAllBooksDatasourceOfflineDecorator {
  GetAllBooksOfflineDecoratorImp(
    IGetAllBooksDatasource allBooksDatasourceOffline,
  ) : super(allBooksDatasourceOffline);
  @override
  Future<Either<Exception, List<AllBooksEntity>>> call() async {
    return (await super()).fold((error) async => Right(await _getInCache()),
        (sucesso) {
      _saveInCache(sucesso);
      return Right(sucesso);
    });
  }

  _saveInCache(List<AllBooksEntity> sucesso) async {
    Box box = await Hive.openBox('listaLivros');
    await box.put('listaOff', sucesso);
  }

  _getInCache() async {
    Box box = await Hive.openBox('listaLivros');
    List<AllBooksEntity> lista = box.get('listaOff')!.cast<AllBooksEntity>();

    return lista;
  }
}
