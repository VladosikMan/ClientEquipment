class User {
  final String name;
  final int? id;
  final int role;
  final double date;

  User({
    required this.name,
    this.id,
    required this.role,
    required this.date,
  });

  // Преобразование объекта в Map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'role': role,
      'date': date,
    };
  }

  // Создание объекта из Map с безопасным парсингом
  factory User.fromJson(Map<String, dynamic> json) {
    // Функции безопасного парсинга
    int? safeParseInt(dynamic value) {
      if (value == null) return null;
      if (value is int) return value;
      if (value is double) return value.toInt();
      if (value is String) return int.tryParse(value);
      return null;
    }

    double safeParseDouble(dynamic value, {double defaultValue = 0.0}) {
      if (value == null) return defaultValue;
      if (value is double) return value;
      if (value is int) return value.toDouble();
      if (value is String) return double.tryParse(value) ?? defaultValue;
      return defaultValue;
    }

    String safeParseString(dynamic value, {String defaultValue = ''}) {
      if (value == null) return defaultValue;
      if (value is String) return value;
      return value.toString();
    }

    return User(
      name: safeParseString(json['name'], defaultValue: 'Без имени'),
      id: safeParseInt(json['id']),
      role: safeParseInt(json['role']) ?? 0,
      date: safeParseDouble(json['date']),
    );
  }

  // Парсинг списка dynamic в список User
  static List<User> parseList(List<dynamic> jsonList) {
    return jsonList
        .map((item) {
      try {
        if (item is Map<String, dynamic>) {
          return User.fromJson(item);
        }
        return null;
      } catch (e) {
        print('Ошибка парсинга элемента User: $e');
        return null;
      }
    })
        .where((user) => user != null)
        .cast<User>()
        .toList();
  }

  // Альтернативный метод парсинга для List<Map<String, dynamic>>
  static List<User> parseMapList(List<Map<String, dynamic>> jsonList) {
    return jsonList
        .map((json) {
      try {
        return User.fromJson(json);
      } catch (e) {
        print('Ошибка парсинга элемента User: $e');
        return null;
      }
    })
        .where((user) => user != null)
        .cast<User>()
        .toList();
  }
}