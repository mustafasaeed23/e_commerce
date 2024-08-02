abstract class AuthLocalDataSource {
  Future<void> casheToken(String token);

  Future<String> getToken();
}
