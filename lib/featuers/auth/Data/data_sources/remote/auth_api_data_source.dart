// ignore_for_file: unused_field, unused_local_variable

import 'package:dio/dio.dart';
import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/core/error/expception.dart';
import 'package:e_commerce/featuers/auth/Data/data_sources/remote/auth_remote_data_source.dart';
import 'package:e_commerce/featuers/auth/Data/models/Login_response.dart';
import 'package:e_commerce/featuers/auth/Data/models/login_request.dart';
import 'package:e_commerce/featuers/auth/Data/models/register_request.dart';
import 'package:e_commerce/featuers/auth/Data/models/Register_response.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRemoteDataSource)
class AuthApiDataSource implements AuthRemoteDataSource {
  // final _dio = Dio(BaseOptions(
  //   receiveDataWhenStatusError: true,
  //   baseUrl: APIConstants.baseUrl,
  // ));
  final Dio _dio;

  const AuthApiDataSource(this._dio);

  @override
  Future<LoginResponse> login(LoginRequest requestBody) async {
    try {
      final response = await _dio.post(
        APIConstants.loginEndPoint,
        data: requestBody.toJson(),
      );
      return LoginResponse.fromJson(response.data);
    } catch (exception) {
      var message = "Failed to Login!";
      if (exception is DioException) {
        final errorMessage = exception.response?.data['message'];
        if (errorMessage != null) message = errorMessage;
      }
      throw RemoteException(message);
    }
  }

  @override
  Future<RegisterResponse> register(RegisterRequest requestBody) async {
    try {
      final response = await _dio.post(
        APIConstants.registerEndPoint,
        data: requestBody.toJson(),
      );
      return RegisterResponse.fromJson(response.data);
    } catch (exception) {
      var message = "Failed to regisetr!";
      if (exception is DioException) {
        final errorMessage = exception.response?.data['message'];
        if (errorMessage != null) message = errorMessage;
      }
      throw RemoteException(message);
    }
  }
}
