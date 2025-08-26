class Detail {
  final int? id;
  final String? articleNumber;
  final String? name;
  final int? status;
  final List<int>? quantity;
  final int? groupId;
  final int? storeId;
  final double date;
  final String? qr;

  Detail({
    this.id,
    this.articleNumber,
    this.name,
    this.status,
    this.quantity,
    this.groupId,
    this.storeId,
    required this.date,
    this.qr,
  });

  // Преобразование объекта в Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'article_number': articleNumber,
      'name': name,
      'status': status,
      'quantity': quantity,
      'group_id': groupId,
      'store_id': storeId,
      'date': date,
      'qr': qr,
    };
  }

  // Создание объекта из Map с безопасным парсингом
  factory Detail.fromJson(Map<String, dynamic> json) {
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

    List<int>? safeParseIntList(dynamic value) {
      if (value == null) return null;
      if (value is List<int>) return value;
      if (value is List<dynamic>) {
        return value
            .map((e) => safeParseInt(e))
            .where((e) => e != null)
            .cast<int>()
            .toList();
      }
      return null;
    }

    String? safeParseString(dynamic value) {
      if (value == null) return null;
      if (value is String) return value;
      return value.toString();
    }

    return Detail(
      id: safeParseInt(json['id']),
      articleNumber: safeParseString(json['article_number']),
      name: safeParseString(json['name']),
      status: safeParseInt(json['status']),
      quantity: safeParseIntList(json['quantity']),
      groupId: safeParseInt(json['group_id']),
      storeId: safeParseInt(json['store_id']),
      date: safeParseDouble(json['date']) ?? 0.0,
      qr: safeParseString(json['qr']),
    );
  }

  // Парсинг списка dynamic в список Detail
  static List<Detail> parseList(List<dynamic> jsonList) {
    return jsonList
        .map((item) {
      try {
        if (item is Map<String, dynamic>) {
          return Detail.fromJson(item);
        }
        return null;
      } catch (e) {
        print('Ошибка парсинга элемента: $e');
        return null;
      }
    })
        .where((detail) => detail != null)
        .cast<Detail>()
        .toList();
  }
}