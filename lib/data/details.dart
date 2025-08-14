class Detail {
  final int id;
  final String name;
  final String? qr;  // Допускаем null
  final int type;
  final String address;
  final DateTime date;  // Используем DateTime вместо double

  Detail({
    required this.id,
    required this.name,
    this.qr,
    required this.type,
    required this.address,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'qr': qr,
      'type': type,
      'address': address,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      id: (json['id'] as int?) ?? 0,
      name: (json['name'] as String?) ?? 'Без названия',
      qr: json['qr'] as String?,
      type: (json['type'] as int?) ?? 0,
      address: (json['address'] as String?) ?? 'Местоположение не указано',
      date: DateTime.fromMillisecondsSinceEpoch(
        (json['date'] as num?)?.toInt() ?? 0,
      ),
    );
  }

}