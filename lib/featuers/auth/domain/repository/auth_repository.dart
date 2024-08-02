import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/featuers/auth/Data/models/login_request.dart';
import 'package:e_commerce/featuers/auth/Data/models/register_request.dart';
import 'package:e_commerce/featuers/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> register(RegisterRequest requestData);
  Future<Either<Failure, User>> login(LoginRequest loginData);
}
