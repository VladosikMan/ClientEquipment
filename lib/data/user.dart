import 'dart:convert';

class User {
  final String name;
  final int? id;
  final String role;
  final double date;

  User({
    required this.name,
    required this.id,
    required this.role,
    required this.date,
  });

  // Конвертация в JSON-объект
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
      'role': role,
      'date': date,
    };
  }

  // Конвертация в JSON-строку
  String toJsonString() {
    return jsonEncode(toJson());
  }

  // Десериализация из JSON-объекта
  static User fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      id: json['id'] as int,
      role: json['role'] as String,
      date: json['date'] as double,
    );
  }

  // Десериализация из JSON-строки
  static User fromJsonString(String jsonString) {
    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    return User.fromJson(json);
  }

  @override
  String toString() => 'User(name: $name, id: $id, role: $role, date: $date)';
}