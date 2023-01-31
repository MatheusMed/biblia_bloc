import 'package:biblia_bloc/app/domain/entities/biblia_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../domain/entities/all_books_entity.dart';
import '../../../domain/repositories/get_all_books_repository.dart';
import '../../datasource/get_all_books_datasource.dart';

class GetAllBooksDataRepositoryImp implements IGetAllBooksRepository {
  final IGetAllBooksDatasource _getAllBooksDatasource;

  GetAllBooksDataRepositoryImp(this._getAllBooksDatasource);

  @override
  Future<Either<Exception, List<AllBooksEntity>>> call() async {
    return await _getAllBooksDatasource();
  }

  @override
  Future<Either<Exception, BibliaEntity>> getCharpter(
      String abbrev, int version) async {
    return await _getAllBooksDatasource.getCharpter(abbrev, version);
  }
}
