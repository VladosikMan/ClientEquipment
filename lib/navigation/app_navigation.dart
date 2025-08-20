// класс для управления навигацией и общими действиями
import 'package:flutter/cupertino.dart';

class AppNavigation extends InheritedWidget{
  final VoidCallback onSettingsPressed;
 // final VoidCallback onNotificationsPressed;
  final VoidCallback onProfilePressed;
  final VoidCallback onBackPressed;

  const AppNavigation({
    super.key,
    required super.child,
    required this.onSettingsPressed,
  /*  required this.onNotificationsPressed,*/
    required this.onProfilePressed,
    required this.onBackPressed,
  });

  static AppNavigation of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<AppNavigation>();
    assert(result != null, 'No AppNavigation found in context');
    return result!;
  }


  @override
  bool updateShouldNotify(AppNavigation oldWidget) {
    return onSettingsPressed != oldWidget.onSettingsPressed ||
        onProfilePressed != oldWidget.onProfilePressed ||
        onBackPressed != oldWidget.onBackPressed;
  }

}