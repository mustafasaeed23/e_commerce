import 'package:e_commerce/featuers/auth/Data/models/Login_response.dart';
import 'package:e_commerce/featuers/auth/Data/models/login_request.dart';
import 'package:e_commerce/featuers/auth/Data/models/register_request.dart';
import 'package:e_commerce/featuers/auth/Data/models/Register_response.dart';

abstract class AuthRemoteDataSource {

  Future <RegisterResponse> register(RegisterRequest requestBody);

  Future <LoginResponse> login(LoginRequest requestBody);
}
