part of '../theme.dart';

ThemeData createDarkYellowTheme() {
  // Создаем базовую темную тему
  final baseTheme = ThemeData.dark();

  return baseTheme.copyWith(
    // Основные цвета
    scaffoldBackgroundColor: const Color(0xFF121212), // Тёмный фон
    primaryColor: Colors.blueGrey[200],

    // Текстовая тема с Google Fonts
    textTheme: GoogleFonts.robotoTextTheme(baseTheme.textTheme).copyWith(
      // Заголовки - желтые
      displayLarge: GoogleFonts.roboto(
        color: Colors.yellow,
        fontSize: 96,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
      ),
      displayMedium: GoogleFonts.roboto(
        color: Colors.yellow,
        fontSize: 60,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
      ),
      displaySmall: GoogleFonts.roboto(
        color: Colors.yellow,
        fontSize: 48,
        fontWeight: FontWeight.w400,
      ),
      headlineMedium: GoogleFonts.roboto(
        color: Colors.yellow,
        fontSize: 34,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      headlineSmall: GoogleFonts.roboto(
        color: Colors.yellow,
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),
      titleLarge: GoogleFonts.roboto(
        color: Colors.yellow,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      ),

      // Основной текст - белый
      bodyLarge: GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
      ),
      bodyMedium: GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      titleMedium: GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
      ),
      titleSmall: GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      ),
      labelLarge: GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
      ),
      bodySmall: GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
      ),
      labelSmall: GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
      ),
    ),

    // Дополнительные настройки
    appBarTheme: AppBarTheme(
      color: const Color(0xFF1A1A1A),
      titleTextStyle: GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      iconTheme: const IconThemeData(color: Colors.yellow),
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
        textStyle: GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),

    // Иконки
    iconTheme: const IconThemeData(color: Colors.yellow),

    // Дополнительные стили для полей ввода
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: GoogleFonts.roboto(
        color: Colors.yellow[200],
      ),
      hintStyle: GoogleFonts.roboto(
        color: Colors.grey[400],
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.yellow[700]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.yellow!),
      ),
    ),
  );
}