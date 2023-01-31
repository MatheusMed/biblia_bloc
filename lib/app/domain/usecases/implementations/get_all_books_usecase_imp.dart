import 'package:biblia_bloc/app/domain/entities/biblia_entity.dart';
import 'package:dartz/dartz.dart';

import '../../entities/all_books_entity.dart';
import '../../repositories/get_all_books_repository.dart';
import '../get_all_books_usecases.dart';

class GetAllBooksUsecasesImp implements IGetAllBooksUsecases {
  final IGetAllBooksRepository _getAllBooksRepository;

  GetAllBooksUsecasesImp(this._getAllBooksRepository);

  @override
  Future<Either<Exception, List<AllBooksEntity>>> call() async {
    return await _getAllBooksRepository();
  }

  @override
  Future<Either<Exception, BibliaEntity>> getCharpter(
      String abbrev, int version) async {
    return await _getAllBooksRepository.getCharpter(abbrev, version);
  }
}
