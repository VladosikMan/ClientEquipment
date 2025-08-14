import 'dart:convert';

class Group {
  final int? id;
  final String name;
  final int storeId;
  final double date;

  Group({
    required this.id,
    required this.name,
    required this.storeId,
    required this.date,
  });

  // Конвертация в JSON-объект
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'store_id': storeId,
      'date': date,
    };
  }

  // Конвертация в JSON-строку
  String toJsonString() {
    return jsonEncode(toJson());
  }

  // Десериализация из JSON-объекта
  static Group fromJson(Map<String, dynamic> json) {
    return Group(
      id: json['id'] as int,
      name: json['name'] as String,
      storeId: json['store_id'] as int,
      date: json['date'] as double,
    );
  }

  // Десериализация из JSON-строки
  static Group fromJsonString(String jsonString) {
    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    return Group.fromJson(json);
  }

  @override
  String toString() => 'Group(id: $id, name: $name, store_id: $storeId, date: $date)';
}