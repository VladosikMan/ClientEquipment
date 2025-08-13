// Экран авторизации
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key, required this.onLogin});
  final VoidCallback onLogin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Логин')),
      body: Center(
        child: ElevatedButton(
          onPressed: onLogin,
          child: const Text('Войти'),
        ),
      ),
    );
  }
}