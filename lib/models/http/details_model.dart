import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../data/details.dart';
import '../../http/http_client.dart';

class DetailsModel with ChangeNotifier {
  //количество деталей
  int length = 0;
  List<Detail> _details = [];

  // Состояние загрузки для отслеживания процесса запроса к серверу.
  bool _isLoading = false;

  // Геттеры для доступа к данным извне. Они не позволяют изменить список напрямую.
  List<Detail> get details => _details;

  Future<void> getLengthDetails() async {
    try {
      final response = await ApiClient().detail.getLengthDetails();
      if (response.statusCode == 200) {
        length = int.parse(response.data);
      } else {}
    } catch (e) {
      //e.toString();
    } finally {
      notifyListeners(); // Снова уведомляем об изменениях
    }
  }

  // получить все детали
  Future<void> getAllDetails() async {
    try {
      final response = await ApiClient().detail.getAllDetails();
      if (response.statusCode == 200) {
        _details = Detail.parseList(response.data);
      } else {}
    } catch (e) {
      e.toString();
      //e.toString();
    } finally {
      notifyListeners(); // Снова уведомляем об изменениях
    }
  }

  Future<void> createDetail(Detail detailData) async {
    try {
      final response = await ApiClient().detail.createDetail(
        detailData.toJson(),
      );
      if (response.statusCode == 200) {
        //TODO обработка создания детали
        _details.insert(0, Detail.fromJson(response.data));
      } else {}
    } catch (e) {
      //e.toString();
    } finally {
      notifyListeners(); // Снова уведомляем об изменениях
    }
  }

  Future<void> deleteDetail(int id) async {
    try {
      final response = await ApiClient().detail.deleteDetailById(id.toString());
      if (response.statusCode == 200) {
        //TODO обработка создания детали
        //     _details.insert(0, Detail.fromJson(response.data));
        final int index = _details.indexOf(
          _details.firstWhere((detail) => detail.id == id),
        );
        _details.removeAt(index);
      } else {}
    } catch (e) {
      //e.toString();
    } finally {
      notifyListeners(); // Снова уведомляем об изменениях
    }
  }
}
