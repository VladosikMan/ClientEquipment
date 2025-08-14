import 'dart:convert';

class Tag {
  final int id;
  final String name;

  Tag({
    required this.id,
    required this.name,
  });

  // Конвертация в JSON-объект
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  // Конвертация в JSON-строку
  String toJsonString() {
    return jsonEncode(toJson());
  }

  // Десериализация из JSON-объекта
  static Tag fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }

  // Десериализация из JSON-строки
  static Tag fromJsonString(String jsonString) {
    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    return Tag.fromJson(json);
  }

  @override
  String toString() => 'Tag(id: $id, name: "$name")';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Tag && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}