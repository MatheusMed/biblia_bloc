import 'package:biblia_bloc/app/domain/entities/biblia_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../domain/entities/all_books_entity.dart';
import '../../../domain/entities/verses_entity.dart';
import '../get_all_books_datasource.dart';

class GetAllBooksDatasourceOfflineDecorator implements IGetAllBooksDatasource {
  final IGetAllBooksDatasource _allBooksDatasourceOffline;
  GetAllBooksDatasourceOfflineDecorator(this._allBooksDatasourceOffline);

  @override
  Future<Either<Exception, List<AllBooksEntity>>> call() =>
      _allBooksDatasourceOffline();

  @override
  Future<Either<Exception, List<VersesEntity>>> getCharpter(
          String abbrev, int version) =>
      _allBooksDatasourceOffline.getCharpter(abbrev, version);
}
