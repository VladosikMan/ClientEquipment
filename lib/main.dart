import 'package:dio/dio.dart';
import 'package:eqiup_client/http/http_client.dart';
import 'package:eqiup_client/models/auth_model.dart';
import 'package:eqiup_client/themes/theme.dart';
import 'package:eqiup_client/values/strings/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'navigation/app_navigation.dart';
import 'navigation/app_route_delegate.dart';
import 'navigation/app_route_parser.dart';

void main() {
  ApiClient();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final authNotifier = AuthModel();
  late final routerDelegate = AppRouterDelegate(authNotifier: authNotifier);
  late final routeParser = AppRouteParser();

  MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return AppNavigation(

      onSettingsPressed: () {
        // Общее поведение для уведомлений
        print('Переход к уведомлениям');
        // Здесь можно добавить навигацию к экрану уведомлений
      },
      onProfilePressed: () {
        // Общее поведение для профиля
        print('Переход к профилю');
        // Здесь можно добавить навигацию к экрану профиля
      },
      onBackPressed: () {
        // Общее поведение для кнопки "Назад"
        routerDelegate.popRoute();
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: createDarkYellowTheme(),
        title: 'Мое приложение',
        routerDelegate: routerDelegate,
        routeInformationParser: routeParser,
      ),
    );
  }
}

// Расширение для доступа к делегату
extension AppRouterDelegateExtension on BuildContext {
  AppRouterDelegate get appRouter =>
      Router.of(this).routerDelegate as AppRouterDelegate;
}