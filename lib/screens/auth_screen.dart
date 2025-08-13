// Экран авторизации
import 'package:flutter/material.dart';

import '../navigation/app_route_delegate.dart';
import '../navigation/app_route_state.dart';

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

// Главный экран
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final delegate = AppRouterDelegate.of();
    return Scaffold(
      appBar: AppBar(title: const Text('Главная')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => delegate?.push(AppRouteState.details(id: 1)),
              child: const Text('Детали'),
            ),
            ElevatedButton(
              onPressed: () => delegate?.push(AppRouteState.journal()),
              child: const Text('Журнал'),
            ),
            ElevatedButton(
              onPressed: () => delegate?.push(AppRouteState.qr()),
              child: const Text('QR-код'),
            ),
          ],
        ),
      ),
    );
  }
}



// Остальные экраны аналогично...

class JournalScreen extends StatelessWidget {
  const JournalScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Журнал')),
      body: Center(
        child: Text(
          'Журнал',
        ),
      ),
    );
  }
}