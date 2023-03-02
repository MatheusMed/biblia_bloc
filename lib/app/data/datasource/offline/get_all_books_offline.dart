// ignore_for_file: unnecessary_cast

import 'package:biblia_bloc/app/core/services/storage/hive_storage.dart';
import 'package:biblia_bloc/app/data/datasource/offline/get_all_books_datasource_offline.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

import '../../../domain/entities/all_books_entity.dart';
import '../get_all_books_datasource.dart';

class GetAllBooksOfflineDecoratorImp
    extends GetAllBooksDatasourceOfflineDecorator {
  final IHiveStorage _hiveStorage;
  GetAllBooksOfflineDecoratorImp(
    IGetAllBooksDatasource allBooksDatasourceOffline,
    this._hiveStorage,
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
    return await _hiveStorage.save('listaOff', sucesso);
  }

  _getInCache() async {
    return await _hiveStorage.get('listaOff');
  }
}
