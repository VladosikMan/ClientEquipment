import 'package:eqiup_client/navigation/app_route_state.dart';
import 'package:eqiup_client/screens/about_screen.dart';
import 'package:eqiup_client/states/auth_notifier.dart';
import 'package:flutter/material.dart';
import '../screens/auth_screen.dart';
import '../screens/details_screen.dart';
import '../screens/home_screen.dart';
import '../screens/journal_screen.dart';
import '../screens/qr_screen.dart';

class AppRouterDelegate extends RouterDelegate<AppRouteState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRouteState> {
  //ключ к состоянию виджета

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static AppRouterDelegate? _instance;

  late final AuthNotifier authNotifier;

  AppRouteState _state = AppRouteState.initial();
  bool _isLoading = true;
  AppRouterDelegate({required this.authNotifier}) {
    //реагируем на измнение авторизации
    _instance = this; // Сохраняем экземпляр
    // if (authNotifier.isLoggedIn) {
    //   _state =AppRouteState.home(); // Автоматический переход
    // }

    // Проверяем при запуске, есть ли сохраненный пользователь
    _checkAuthStatus();
    authNotifier.addListener(_onAuthStateChanged);
  }

  // Проверка статуса авторизации
  Future<void> _checkAuthStatus() async {
    final hasUser = await authNotifier.hasRegisteredUser();

    if (hasUser) {
      // Если пользователь уже зарегистрирован, загружаем его данные
      await authNotifier.loadUserData();
      _state = AppRouteState.home();
    }

    _isLoading = false;
    notifyListeners();
  }


  // Реакция на изменение статуса авторизации
  void _onAuthStateChanged() {
    if (authNotifier.isLoggedIn) {
      _state = _state.copyWith(isLoggedIn: true, name: 'home');
    } else {
      _state = _state.copyWith(isLoggedIn: false, name: 'auth');
    }
    notifyListeners();
  }

  static AppRouterDelegate? of(){
    return _instance;
  }
  // Текущее состояние
  @override
  AppRouteState get currentConfiguration => _state;

  // Обработка навигации
  void push(AppRouteState newState) {
    _state = newState;
    notifyListeners();
  }

  //обработка кнопки назад
  @override
  Future<bool> popRoute() {
    //если на экране авторизации - не даем выйти

    if (_state.name == 'auth') return Future.value(false);

    //возврат на главный экран
    if (_state.name != 'home') {
      _state = AppRouteState.home();
      notifyListeners();
      return Future.value(true);
    }

    //если уже на главном - стандартное поведение
    return Future.value(false);
  }

  // этот метод будет использоваться при изменения состояния - построение страниц
  @override
  Widget build(BuildContext context) {

    if (_isLoading) {
      return const Material(
        child: Center(child: CircularProgressIndicator()),
      );
    }


    // TODO: implement build
    return Navigator(
      key: navigatorKey,
      pages: _buildPages(),
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        popRoute();
        return true;
      },
    );
  }

  List<Page> _buildPages() {
    final pages = <Page>[];
    // Всегда добавляем AuthScreen если не авторизованы
    if (!authNotifier.isLoggedIn) {
      pages.add(
        MaterialPage(
          key: const ValueKey('AuthPage'),
          child: AuthScreen(authNotifier: authNotifier),
        ),
      );
    }
    if(authNotifier.isLoggedIn) {
      pages.add(
        MaterialPage(key: const ValueKey('HomePage'), child: HomeScreen()),
      );
    }
    // Дополнительные экраны поверх главного
    switch (_state.name) {
      case 'details':
        pages.add(
          MaterialPage(
            key: const ValueKey('DetailsPage'),
            child: DetailsScreen(/*id: _state.params['id']*/),
          ),
        );
        break;
      case 'journal':
        pages.add(
          MaterialPage(
            key: const ValueKey('JournalPage'),
            child: JournalScreen(),
          ),
        );
        break;
      case 'qr':
        pages.add(
          MaterialPage(
            key: const ValueKey('QrPage'),
            child: QrScreen(),
          ),
        );
        break;
      case 'about':
        pages.add(
          MaterialPage(
            key: const ValueKey('AboutPage'),
            child: AboutScreen(),
          ),
        );
        break;
    }

    return pages;
  }

  //при изменение пути
  // Обработка внешних команд (глубокие ссылки)
  @override
  Future<void> setNewRoutePath(AppRouteState configuration) async {
    _state = configuration;
  }


}
