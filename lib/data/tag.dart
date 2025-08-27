class Tag {
  final int id;
  final String name;

  Tag({required this.id, required this.name});

  // Преобразование объекта в Map
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }

  // Создание объекта из Map с безопасным парсингом
  factory Tag.fromJson(Map<String, dynamic> json) {
    // Функции безопасного парсинга
    int safeParseInt(dynamic value, {int defaultValue = 0}) {
      if (value == null) return defaultValue;
      if (value is int) return value;
      if (value is double) return value.toInt();
      if (value is String) return int.tryParse(value) ?? defaultValue;
      return defaultValue;
    }

    String safeParseString(dynamic value, {String defaultValue = ''}) {
      if (value == null) return defaultValue;
      if (value is String) return value;
      return value.toString();
    }

    return Tag(
      id: safeParseInt(json['id']),
      name: safeParseString(json['name'], defaultValue: 'Без названия'),
    );
  }

  // Парсинг списка dynamic в список Tag
  static List<Tag> parseList(List<dynamic> jsonList) {
    return jsonList
        .map((item) {
          try {
            if (item is Map<String, dynamic>) {
              return Tag.fromJson(item);
            }
            return null;
          } catch (e) {
            print('Ошибка парсинга элемента Tag: $e');
            return null;
          }
        })
        .where((tag) => tag != null)
        .cast<Tag>()
        .toList();
  }

  // Альтернативный метод парсинга для List<Map<String, dynamic>>
  static List<Tag> parseMapList(List<Map<String, dynamic>> jsonList) {
    return jsonList
        .map((json) {
          try {
            return Tag.fromJson(json);
          } catch (e) {
            print('Ошибка парсинга элемента Tag: $e');
            return null;
          }
        })
        .where((tag) => tag != null)
        .cast<Tag>()
        .toList();
  }
}
