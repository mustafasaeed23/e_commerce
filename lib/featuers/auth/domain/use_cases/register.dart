// ignore_for_file: unused_field

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/featuers/auth/Data/models/register_request.dart';
import 'package:e_commerce/featuers/auth/domain/entities/user.dart';
import 'package:e_commerce/featuers/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class Register {
  final AuthRepository _authRepository;

  const Register(this._authRepository);

  Future<Either<Failure, User>> call(RegisterRequest registerData) =>
      _authRepository.register(registerData);
}
