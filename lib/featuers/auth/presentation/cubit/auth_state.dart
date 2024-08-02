abstract class AuthState {}

class AuthInitial extends AuthState {}

// login
class LoginLoding extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginError extends AuthState {
  final String message;

  LoginError(this.message);

}

// register
class RegisterLoding extends AuthState {}

class RegisterSuccess extends AuthState {}

class RegisterError extends AuthState {
   final String message;

  RegisterError(this.message);
}
