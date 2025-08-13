import 'package:eqiup_client/states/auth_notifier.dart';
import 'package:eqiup_client/themes/theme.dart';
import 'package:eqiup_client/values/strings/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'navigation/app_route_delegate.dart';
import 'navigation/app_route_parser.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authNotifier = AuthNotifier();
  late final routerDelegate = AppRouterDelegate(authNotifier: authNotifier);
  late final routeParser = AppRouteParser();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Навигация',
      routerDelegate: routerDelegate,
      routeInformationParser: routeParser,
      // Для глубоких ссылок в вебе
      backButtonDispatcher: RootBackButtonDispatcher(),
    );
  }
}

// Расширение для доступа к делегату
extension AppRouterDelegateExtension on BuildContext {
  AppRouterDelegate get appRouter =>
      Router.of(this).routerDelegate as AppRouterDelegate;
}