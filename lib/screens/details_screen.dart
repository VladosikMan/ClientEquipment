import 'dart:developer';
import 'package:eqiup_client/data/user.dart';
import 'package:flutter/material.dart';

import '../http/http_client.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Детали')),
      body: Center(
        child:ElevatedButton(
          onPressed:  () async {
            final apiClient = ApiClient().getSimpleRequest("/ping"); // Создаем клиент
            try {
              // User user = User(name: "Аная", id: null, role: 1, date: 121313);
              // final response = await apiClient.user.createUser(user.toJson());
              // log('Пользователь создан: ${response.data}');
            } catch (e) {
              log('Ошибка: $e');
            }
          },
          child: const Text('Войти'),
        ),
      ),
    );
  }
}