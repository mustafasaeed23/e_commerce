abstract class AuthLocalDataSource {
  Future<void> casheToken(String token);

  String getToken();
}
