import 'package:biblia_bloc/app/core/utils.dart';
import 'package:dio/dio.dart';

abstract class IHttpServices {
  Dio dio();
}

class HttpServices implements IHttpServices {
  @override
  Dio dio() {
    return Dio(
      BaseOptions(
        baseUrl: Utils.BASE_URL,
        headers: {
          "Authorization": Utils.TOKEN,
        },
      ),
    );
  }
}
