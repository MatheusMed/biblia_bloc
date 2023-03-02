import 'package:dartz/dartz.dart';

import '../../domain/entities/entities.dart';

abstract class IGetAllBooksDatasource {
  Future<Either<Exception, List<AllBooksEntity>>> call();
  Future<Either<Exception, List<VersesEntity>>> getCharpter(
      String abbrev, int version);
}
