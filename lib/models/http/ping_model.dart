import 'package:eqiup_client/http/http_client.dart';
import 'package:flutter/cupertino.dart';

class PingModel with ChangeNotifier{
  bool status = false;
  String? message;
  Future<void> fetchData() async {
    try {
      final response = await ApiClient().getSimpleRequest("/ping");
      if(response.statusCode == 200){
        status = true;
      }else{
        status = false;
      }
      message = response.statusMessage;
    } catch (e) {
      status = false;
      message = e.toString();
    } finally {
      notifyListeners(); // Снова уведомляем об изменениях
    }
  }
}
