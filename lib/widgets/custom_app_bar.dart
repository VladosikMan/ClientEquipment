import 'package:flutter/material.dart';

import '../navigation/app_navigation.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String screenTitle;
  final bool showBackButton;

  const CustomAppBar({
    super.key,
    required this.screenTitle,
    this.showBackButton = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final navigation = AppNavigation.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isWide = constraints.maxWidth > 600;

        return AppBar(
          automaticallyImplyLeading: false,
          leading: showBackButton
              ? IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: navigation.onBackPressed,
          )
              : null,
          title: isWide
              ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Название экрана
              Text(
                screenTitle,
              ),
            ],
          )
              : Center(
            child: Text(
              screenTitle,

              overflow: TextOverflow.ellipsis,
            ),
          ),
          centerTitle: true,
          actions: [
            // Кнопка переключения темы
            IconButton(
              icon: const Icon(Icons.brightness_6),
              onPressed: ()=>{},
              tooltip: 'Сменить тему',
            ),

            // Адаптивные действия
            if (isWide) ...[
              // Полные кнопки на широких экранах
              TextButton.icon(
                onPressed: navigation.onSettingsPressed,
                icon: const Icon(Icons.settings),
                label: const Text('Настройки'),
              ),
              TextButton.icon(
                onPressed: navigation.onProfilePressed,
                icon: const Icon(Icons.person),
                label: const Text('Профиль'),
              ),
            ] else ...[
              // Иконки на узких экранах
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: navigation.onSettingsPressed,
                tooltip: 'Уведомления',
              ),
              IconButton(
                icon: const Icon(Icons.person),
                onPressed: navigation.onProfilePressed,
                tooltip: 'Профиль',
              ),
            ],
            const SizedBox(width: 8),
          ],
        );
      },
    );
  }
}