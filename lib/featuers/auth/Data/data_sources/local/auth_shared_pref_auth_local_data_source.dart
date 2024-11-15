// ignore_for_file: unused_local_variable

import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/core/error/expception.dart';
import 'package:e_commerce/featuers/auth/Data/data_sources/local/auth_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: AuthLocalDataSource)
class AuthSharedPrefLocalDataSource implements AuthLocalDataSource {
  final SharedPreferences _sharedPref;
  const AuthSharedPrefLocalDataSource(this._sharedPref);
  @override
  Future<void> casheToken(String token) async {
    try {
      await _sharedPref.setString(CasheConstants.tokenKey, token);
    } catch (_) {
      throw LocalException("Failed to store token");
    }
  }

  @override
  String getToken() {
    try {
      return _sharedPref.getString(CasheConstants.tokenKey)!;
    } catch (_) {
      throw LocalException("Failed to get token");
    }
  }
}
