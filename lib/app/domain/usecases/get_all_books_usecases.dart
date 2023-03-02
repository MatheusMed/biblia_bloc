import 'package:biblia_bloc/app/domain/entities/verses_entity.dart';
import 'package:dartz/dartz.dart';

import '../entities/all_books_entity.dart';
import '../entities/biblia_entity.dart';

abstract class IGetAllBooksUsecases {
  Future<Either<Exception, List<AllBooksEntity>>> call();
  Future<Either<Exception, List<VersesEntity>>> getCharpter(
      String abbrev, int version);
}
