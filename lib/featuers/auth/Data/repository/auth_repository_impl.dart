// ignore_for_file: unused_field, unused_local_variable, empty_catches

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/expception.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/featuers/auth/Data/data_sources/local/auth_local_data_source.dart';
import 'package:e_commerce/featuers/auth/Data/data_sources/remote/auth_remote_data_source.dart';
import 'package:e_commerce/featuers/auth/Data/models/login_request.dart';
import 'package:e_commerce/featuers/auth/Data/models/register_request.dart';
import 'package:e_commerce/featuers/auth/domain/entities/user.dart';
import 'package:e_commerce/featuers/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource, this._authLocalDataSource);

  @override
  Future<Either<Failure, User>> login(LoginRequest requestData) async {
    try {
      final response = await _authRemoteDataSource.login(requestData);
      if (response.token != null && response.user != null) {
        await _authLocalDataSource.casheToken(response.token!);
        return Right(response.user!);
      } else {
        return Left(Failure('Error while Trying to login'));
      }
    } on AppException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, User>> register(
      RegisterRequest requestData) async {
    try {
      final response = await _authRemoteDataSource.register(requestData);
      if (response.token != null && response.user != null) {
        await _authLocalDataSource.casheToken(response.token!);
        return Right(response.user!);
      } else {
        return Left(Failure('Error while Trying to register'));
      }
    } on AppException catch (exception) {
      return Left(Failure(exception.message));
    }
  }
}
