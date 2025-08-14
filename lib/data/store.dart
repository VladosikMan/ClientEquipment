import 'dart:convert';

class Store {
  final int? id;
  final String qr;
  final String name;
  final int type;
  final String address;
  final double date;

  Store({
    required this.id,
    required this.qr,
    required this.name,
    required this.type,
    required this.address,
    required this.date,
  });

  // Конвертация в JSON-объект
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

  // Конвертация в JSON-строку
  String toJsonString() {
    return jsonEncode(toJson());
  }

  // Десериализация из JSON-объекта
  static Store fromJson(Map<String, dynamic> json) {
    return Store(
      id: json['id'] as int,
      qr: json['qr'] as String,
      name: json['name'] as String,
      type: json['type'] as int,
      address: json['address'] as String,
      date: json['date'] as double,
    );
  }

  // Десериализация из JSON-строки
  static Store fromJsonString(String jsonString) {
    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    return Store.fromJson(json);
  }

  @override
  String toString() {
    return 'Store(id: $id, qr: $qr, name: $name, type: $type, address: $address, date: $date)';
  }
}