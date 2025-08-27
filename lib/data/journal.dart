class Journal {
  final int id;
  final String comment;
  final int typeAction;
  final int userId;
  final int detailId;
  final double date;

  Journal({
    required this.id,
    required this.comment,
    required this.typeAction,
    required this.userId,
    required this.detailId,
    required this.date,
  });

  // Преобразование объекта в Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'comment': comment,
      'typeAction': typeAction,
      'userId': userId,
      'detailId': detailId,
      'date': date,
    };
  }

  // Создание объекта из Map с безопасным парсингом
  factory Journal.fromJson(Map<String, dynamic> json) {
    // Функции безопасного парсинга
    int safeParseInt(dynamic value, {int defaultValue = 0}) {
      if (value == null) return defaultValue;
      if (value is int) return value;
      if (value is double) return value.toInt();
      if (value is String) return int.tryParse(value) ?? defaultValue;
      return defaultValue;
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

    return Journal(
      id: safeParseInt(json['id']),
      comment: safeParseString(
        json['comment'],
        defaultValue: 'Нет комментария',
      ),
      typeAction: safeParseInt(json['typeAction']),
      userId: safeParseInt(json['userId']),
      detailId: safeParseInt(json['detailId']),
      date: safeParseDouble(json['date']),
    );
  }

  // Парсинг списка dynamic в список Journal
  static List<Journal> parseList(List<dynamic> jsonList) {
    return jsonList
        .map((item) {
          try {
            if (item is Map<String, dynamic>) {
              return Journal.fromJson(item);
            }
            return null;
          } catch (e) {
            print('Ошибка парсинга элемента Journal: $e');
            return null;
          }
        })
        .where((journal) => journal != null)
        .cast<Journal>()
        .toList();
  }

  // Альтернативный метод парсинга для List<Map<String, dynamic>>
  static List<Journal> parseMapList(List<Map<String, dynamic>> jsonList) {
    return jsonList
        .map((json) {
          try {
            return Journal.fromJson(json);
          } catch (e) {
            print('Ошибка парсинга элемента Journal: $e');
            return null;
          }
        })
        .where((journal) => journal != null)
        .cast<Journal>()
        .toList();
  }
}
