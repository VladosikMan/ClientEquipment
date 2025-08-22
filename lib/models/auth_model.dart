import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/user.dart';
import '../values/strings/app_strings.dart';

class AuthModel extends ChangeNotifier {
  User? _currentUser;
  bool _isLoggedIn = false;

  User? get currentUser => _currentUser;

  bool get isLoggedIn => _isLoggedIn;

  // Загрузк данных пользователя при инициализации
  Future<void> loadUserData() async {

    final prefs = await SharedPreferences.getInstance();
    //await prefs.clear(); // Очищает все данные
    final userData = prefs.getString(USER_DATA);

    if (userData != null) {
      try {
        final userMap = jsonDecode(userData);
        _currentUser = User.fromJson(userMap);

        //TODO - здесь проверка пользователя на сервере
        _isLoggedIn = true;
      } catch (e) {
        print('Ошибка загрузки данных пользователя: $e');
      }
    }
  }

  Future<bool> login(User user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(USER_DATA, jsonEncode(user.toJson()));

      _currentUser = user;
      _isLoggedIn = true;
      notifyListeners();

      return true;
    } catch (e) {
      print('Ошибка сохранения пользователя: $e');
      return false;
    }
  }

  // Выход
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_data');

    _currentUser = null;
    _isLoggedIn = false;
    notifyListeners();
  }

  // Проверка, зарегистрирован ли пользователь
  Future<bool> hasRegisteredUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('user_data');
  }
}
