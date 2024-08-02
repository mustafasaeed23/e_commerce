class RegisterRequest {
  final String email;
  final String password;
  final String name;
  final String phone;

  RegisterRequest(
      {required this.email,
      required this.password,
      required this.name,
      required this.phone});

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "rePassword": password,
        "phone": phone
      };
}
