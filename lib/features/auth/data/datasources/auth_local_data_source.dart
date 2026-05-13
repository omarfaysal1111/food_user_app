import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:food_user_app/core/storage/token_storage.dart';
import 'package:food_user_app/features/auth/data/models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheUser(UserModel user);

  Future<UserModel?> getCachedUser();

  Future<void> clearCachedUser();

  Future<void> cacheAccessToken(String token);

  Future<void> cacheRefreshToken(String token);

  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<void> clearTokens();

  /// Clears only the refresh token (e.g. when register response omits it).
  Future<void> clearRefreshToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl({
    required SharedPreferences prefs,
    required TokenStorage tokenStorage,
  }) : _prefs = prefs,
       _tokenStorage = tokenStorage;

  static const String _cachedUserKey = 'auth_cached_user_json';

  final SharedPreferences _prefs;
  final TokenStorage _tokenStorage;

  @override
  Future<void> cacheUser(UserModel user) async {
    await _prefs.setString(_cachedUserKey, jsonEncode(user.toJson()));
  }

  @override
  Future<UserModel?> getCachedUser() async {
    final raw = _prefs.getString(_cachedUserKey);
    if (raw == null || raw.isEmpty) return null;
    try {
      final map = jsonDecode(raw);
      if (map is! Map<String, dynamic>) return null;
      return UserModel.fromJson(map);
    } on Object {
      return null;
    }
  }

  @override
  Future<void> clearCachedUser() async {
    await _prefs.remove(_cachedUserKey);
  }

  @override
  Future<void> cacheAccessToken(String token) {
    return _tokenStorage.saveAccessToken(token);
  }

  @override
  Future<void> cacheRefreshToken(String token) {
    return _tokenStorage.saveRefreshToken(token);
  }

  @override
  Future<String?> getAccessToken() {
    return _tokenStorage.getAccessToken();
  }

  @override
  Future<String?> getRefreshToken() {
    return _tokenStorage.getRefreshToken();
  }

  @override
  Future<void> clearTokens() async {
    await _tokenStorage.clearAll();
  }

  @override
  Future<void> clearRefreshToken() {
    return _tokenStorage.clearRefreshToken();
  }
}
