import 'package:eqiup_client/data/store.dart';
import 'package:flutter/foundation.dart';

import '../../http/http_client.dart';

class StoreModel with ChangeNotifier {
  //количество мест
  int length = 0;
  List<Store> _stores = [];

  List<Store> get stores => _stores;

  StoreModel() {
 //   getLengthStore(); // Вызов при создании контроллера
    getAllStores();
  }

  Future<void> getLengthStore() async {
    try {
      final response = await ApiClient().store.getLengthStore();
      if (response.statusCode == 200) {
        length = int.parse(response.data);
      } else {}
    } catch (e) {
      //e.toString();
    } finally {
      notifyListeners(); // Снова уведомляем об изменениях
    }
  }

  Future<void> getAllStores() async {
    try {
      final response = await ApiClient().store.getAllStores();
      if (response.statusCode == 200) {
        _stores = Store.parseList(response.data);
      } else {}
    } catch (e) {
      //e.toString();
    } finally {
      notifyListeners(); // Снова уведомляем об изменениях
    }
  }
}
