import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/featuers/auth/Data/models/login_request.dart';
import 'package:e_commerce/featuers/auth/domain/entities/user.dart';
import 'package:e_commerce/featuers/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class Login {
  final AuthRepository _authRepository;

  const Login(this._authRepository);

  Future<Either<Failure, User>> call(LoginRequest loginData) =>
      _authRepository.login(loginData);
}