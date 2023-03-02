import 'package:dartz/dartz.dart';

import '../entities/entities.dart';

abstract class IGetAllBooksRepository {
  Future<Either<Exception, List<AllBooksEntity>>> call();
  Future<Either<Exception, List<VersesEntity>>> getCharpter(
      String abbrev, int version);
}
