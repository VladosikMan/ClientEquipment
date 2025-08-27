class Store {
  final int? id;
  final String qr;
  final String name;
  final int type;
  final String address;
  final double date;

  Store({
    this.id,
    required this.qr,
    required this.name,
    required this.type,
    required this.address,
    required this.date,
  });

  // Преобразование объекта в Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'qr': qr,
      'name': name,
      'type': type,
      'address': address,
      'date': date,
    };
  }

  // Создание объекта из Map с безопасным парсингом
  factory Store.fromJson(Map<String, dynamic> json) {
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

    return Store(
      id: safeParseInt(json['id']),
      qr: safeParseString(json['qr']),
      name: safeParseString(json['name'], defaultValue: 'Без названия'),
      type: safeParseInt(json['type']) ?? 0,
      address: safeParseString(
        json['address'],
        defaultValue: 'Адрес не указан',
      ),
      date: safeParseDouble(json['date']) ?? 0.0,
    );
  }

  // Парсинг списка dynamic в список Store
  static List<Store> parseList(List<dynamic> jsonList) {
    return jsonList
        .map((item) {
          try {
            if (item is Map<String, dynamic>) {
              return Store.fromJson(item);
            }
            return null;
          } catch (e) {
            print('Ошибка парсинга элемента Store: $e');
            return null;
          }
        })
        .where((store) => store != null)
        .cast<Store>()
        .toList();
  }

  // Альтернативный метод парсинга для List<Map<String, dynamic>>
  static List<Store> parseMapList(List<Map<String, dynamic>> jsonList) {
    return jsonList
        .map((json) {
          try {
            return Store.fromJson(json);
          } catch (e) {
            print('Ошибка парсинга элемента Store: $e');
            return null;
          }
        })
        .where((store) => store != null)
        .cast<Store>()
        .toList();
  }
}
