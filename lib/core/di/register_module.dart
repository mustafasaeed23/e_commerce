import 'package:dio/dio.dart';
import 'package:e_commerce/core/constants.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio {
    final dio = Dio(
      BaseOptions(
        baseUrl: APIConstants.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          final sharedPref = await SharedPreferences.getInstance();
          final token = sharedPref.get(CasheConstants.tokenKey);
          if (token != null) {
            options.headers[APIConstants.tokenHeaderKey] = token;
          }
          return handler.next(options);
        },
      ),
    );
    return dio;
  }

  @preResolve
  Future<SharedPreferences> get sharedPref => SharedPreferences.getInstance();
}
