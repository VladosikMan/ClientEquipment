class AppRouteState{
    final String name; //имя маршрута
    final Map<String, dynamic> params; // параметры
    final bool isLoggedIn; // статус авторизации

    // Приватный конструктор
    AppRouteState._({
      required this.name,
      required this.params,
      required this.isLoggedIn,
    });


    // Начальное состояние (авторизация)
    factory AppRouteState.initial() => AppRouteState._(
      name: 'auth',
      params: {},
      isLoggedIn: false,
    );

    // Методы для создания состояний:
    factory AppRouteState.auth() => AppRouteState._(
      name: 'auth',
      params: {},
      isLoggedIn: false,
    );

    factory AppRouteState.home() => AppRouteState._(
      name: 'home',
      params: {},
      isLoggedIn: true,
    );

    factory AppRouteState.details({required int id}) => AppRouteState._(
      name: 'details',
      params: {'id': id},
      isLoggedIn: true,
    );

    factory AppRouteState.journal() => AppRouteState._(
      name: 'journal',
      params: {},
      isLoggedIn: true,
    );

    factory AppRouteState.qr() => AppRouteState._(
      name: 'qr',
      params: {},
      isLoggedIn: true,
    );

    factory AppRouteState.about() => AppRouteState._(
      name: 'about',
      params: {},
      isLoggedIn: true,
    );
    // Обновление состояния (для иммутабельности)
    AppRouteState copyWith({
      String? name,
      Map<String, dynamic>? params,
      bool? isLoggedIn,
    }) =>
        AppRouteState._(
          name: name ?? this.name,
          params: params ?? this.params,
          isLoggedIn: isLoggedIn ?? this.isLoggedIn,
        );
}