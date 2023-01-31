import 'package:biblia_bloc/app/core/utils.dart';
import 'package:biblia_bloc/app/data/dto/biblia_dto.dart';
import 'package:biblia_bloc/app/domain/entities/biblia_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../domain/entities/all_books_entity.dart';
import '../../dto/all_books_dto.dart';
import '../get_all_books_datasource.dart';

class GetAllBooksRemoteImp implements IGetAllBooksDatasource {
  final Dio dio;

  GetAllBooksRemoteImp(this.dio);

  @override
  Future<Either<Exception, List<AllBooksEntity>>> call() async {
    try {
      var books = await dio.get(
        Utils.BASE_URL,
        options: Options(headers: {
          "Authorization": Utils.TOKEN,
        }),
      );
      return right(
          (books.data as List).map((e) => AllBooksDto.fromMap(e)).toList());
    } catch (e) {
      return Left(Exception('Erro no datasource remote'));
    }
  }

  @override
  Future<Either<Exception, BibliaEntity>> getCharpter(
      String abbrev, int version) async {
    try {
      var charpters = await dio.get(
          'https://www.abibliadigital.com.br/api/verses/nvi/$abbrev/$version');
      var result = BibliaDto.fromMap(charpters.data);

      return Right(result);
    } catch (e) {
      return Left(Exception('Erro na datasource get Charpters'));
    }
  }
}
