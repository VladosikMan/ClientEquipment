// Экран авторизации
import 'package:flutter/material.dart';

import '../navigation/app_route_delegate.dart';
import '../navigation/app_route_state.dart';
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