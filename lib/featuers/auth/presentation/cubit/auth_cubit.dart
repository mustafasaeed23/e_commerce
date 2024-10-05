// ignore_for_file: unused_field, unused_local_variable, non_constant_identifier_names

import 'package:bloc/bloc.dart';
import 'package:e_commerce/featuers/auth/Data/models/login_request.dart';
import 'package:e_commerce/featuers/auth/Data/models/register_request.dart';
import 'package:e_commerce/featuers/auth/domain/use_cases/login.dart';
import 'package:e_commerce/featuers/auth/domain/use_cases/register.dart';
import 'package:e_commerce/featuers/auth/presentation/cubit/auth_state.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._login, this._register) : super(AuthInitial());

  final Login _login;
  final Register _register;

  Future<void> register(RegisterRequest requestData) async {
    emit(RegisterLoding());

    final result = await _register(requestData);
    result.fold(
      (failure) => emit(RegisterError(failure.message)),
      (_) => emit(RegisterSuccess()),
    );
  }

  Future<void> login(LoginRequest requestData) async {
    emit(LoginLoding());

    final result = await _login(requestData);
    result.fold(
      (failure) => emit(LoginError(failure.message)),
      (_) => emit(LoginSuccess()),
    );
  }
}
