part of '../theme.dart';

ThemeData createDarkYellowTheme(){
  return ThemeData(
    // Основные цвета
    scaffoldBackgroundColor: const Color(0xFF121212), // Тёмный фон
    primaryColor: Colors.blueGrey[200],

    // Цвет текста - ЖЁЛТЫЙ
    textTheme: const TextTheme().apply(
      bodyColor: Colors.white, // Основной текст
      displayColor: Colors.yellow, // Заголовки
      decorationColor: Colors.yellow, // Для подчёркиваний
    ),

    // Дополнительные настройки
    appBarTheme: const AppBarTheme(
      color: Color(0xFF1A1A1A),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),

    // Цвета для элементов UI
    colorScheme: ColorScheme.dark().copyWith(
      secondary: Colors.amber, // Акцентный цвет
      onSurface: Colors.yellow, // Текст на поверхностях
    ),

    // Стиль кнопок
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.yellow,
      ),
    ),

    // Иконки
    iconTheme: const IconThemeData(color: Colors.yellow),
  );
}