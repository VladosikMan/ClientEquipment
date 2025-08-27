class Group {
  final int? id;
  final String name;
  final int storeId;
  final double date;

  Group({
    this.id,
    required this.name,
    required this.storeId,
    required this.date,
  });

  // Преобразование объекта в Map
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'storeId': storeId, 'date': date};
  }

  // Создание объекта из Map с безопасным парсингом
  factory Group.fromJson(Map<String, dynamic> json) {
    // Функции безопасного парсинга
    int? safeParseInt(dynamic value) {
      if (value == null) return null;
      if (value is int) return value;
      if (value is double) return value.toInt();
      if (value is String) return int.tryParse(value);
      return null;
    }

    double? safeParseDouble(dynamic value) {
      if (value == null) return null;
      if (value is double) return value;
      if (value is int) return value.toDouble();
      if (value is String) return double.tryParse(value);
      return null;
    }

    String safeParseString(dynamic value, {String defaultValue = ''}) {
      if (value == null) return defaultValue;
      if (value is String) return value;
      return value.toString();
    }

    return Group(
      id: safeParseInt(json['id']),
      name: safeParseString(json['name'], defaultValue: 'Без названия'),
      storeId: safeParseInt(json['storeId']) ?? 0,
      date: safeParseDouble(json['date']) ?? 0.0,
    );
  }

  // Парсинг списка dynamic в список Group
  static List<Group> parseList(List<dynamic> jsonList) {
    return jsonList
        .map((item) {
          try {
            if (item is Map<String, dynamic>) {
              return Group.fromJson(item);
            }
            return null;
          } catch (e) {
            print('Ошибка парсинга элемента Group: $e');
            return null;
          }
        })
        .where((group) => group != null)
        .cast<Group>()
        .toList();
  }

  // Альтернативный метод парсинга для List<Map<String, dynamic>>
  static List<Group> parseMapList(List<Map<String, dynamic>> jsonList) {
    return jsonList
        .map((json) {
          try {
            return Group.fromJson(json);
          } catch (e) {
            print('Ошибка парсинга элемента Group: $e');
            return null;
          }
        })
        .where((group) => group != null)
        .cast<Group>()
        .toList();
  }
}
