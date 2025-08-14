import 'dart:convert';

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

  // Конвертация в JSON-объект
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

  // Конвертация в JSON-строку
  String toJsonString() {
    return jsonEncode(toJson());
  }

  // Десериализация из JSON-объекта
  static Journal fromJson(Map<String, dynamic> json) {
    return Journal(
      id: json['id'] as int,
      comment: json['comment'] as String,
      typeAction: json['typeAction'] as int,
      userId: json['userId'] as int,
      detailId: json['detailId'] as int,
      date: json['date'] as double,
    );
  }

  // Десериализация из JSON-строки
  static Journal fromJsonString(String jsonString) {
    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    return Journal.fromJson(json);
  }

  @override
  String toString() {
    return 'Journal(id: $id, comment: "$comment", typeAction: $typeAction, '
        'userId: $userId, detailId: $detailId, date: $date)';
  }
}