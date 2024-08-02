// ignore_for_file: unused_local_variable

import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/core/error/expception.dart';
import 'package:e_commerce/featuers/auth/Data/data_sources/local/auth_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: AuthLocalDataSource)
class AuthSharedPrefLocalDataSource implements AuthLocalDataSource {
  @override
  Future<void> casheToken(String token) async {
    try {
      final sharedPref = await SharedPreferences.getInstance();
      await sharedPref.setString(CasheConstants.tokenKey, token);
    } catch (exception) {
      throw LocalException("Failed to store token");
    }
  }

  @override
  Future<String> getToken() async {
    try {
      final sharedPref = await SharedPreferences.getInstance();
      return sharedPref.getString(CasheConstants.tokenKey)!;
    } catch (_) {
      throw LocalException("Failed to get token");
    }
  }
}
