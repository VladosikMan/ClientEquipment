import 'package:flutter/cupertino.dart';

import 'app_route_state.dart';

class AppRouteParser extends RouteInformationParser<AppRouteState> {
  @override
  Future<AppRouteState> parseRouteInformation(
      RouteInformation routeInformation) async {

    final uri = Uri.parse(routeInformation.location ?? '/');

    // Обработка разных путей
    switch (uri.path) {
      case '/login':
        return AppRouteState.auth();
      case '/home':
        return AppRouteState.home();
      case '/details':
        final id = int.tryParse(uri.queryParameters['id'] ?? '0');
        return AppRouteState.details(id: id ?? 0);
      case '/journal':
        return AppRouteState.journal();
      case '/qr':
        return AppRouteState.qr();
      default:
        return AppRouteState.initial();
    }
  }

  @override
  RouteInformation restoreRouteInformation(AppRouteState configuration) {
    switch (configuration.name) {
      case 'auth':
        return const RouteInformation(location: '/login');
      case 'home':
        return const RouteInformation(location: '/home');
      case 'details':
        return RouteInformation(
            location: '/details?id=${configuration.params['id']}');
      case 'journal':
        return const RouteInformation(location: '/journal');
      case 'qr':
        return const RouteInformation(location: '/qr');
      default:
        return const RouteInformation(location: '/');
    }
  }
}