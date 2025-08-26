import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../data/details.dart';
import '../../http/http_client.dart';

class DetailsModel with ChangeNotifier {
  //количество деталей
  int length = 0;
  List<Detail> _details = [];
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

  Future<void> createDetail(Map<String, dynamic> detailData) async {
    try {
      final response = await ApiClient().detail.createDetail(detailData);
      if (response.statusCode == 200) {
        //TODO обработка создания детали
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
        int x = 11;
        //TODO обработка создания детали
      } else {}
    } catch (e) {
      e.toString();
      //e.toString();
    } finally {
      notifyListeners(); // Снова уведомляем об изменениях
    }
  }
}
