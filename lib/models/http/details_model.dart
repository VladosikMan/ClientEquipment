/*


import 'package:flutter/cupertino.dart';

import '../../http/http_client.dart';

class DetailsModel with ChangeNotifier{
  //количество деталей
  int quantity = 0;
  Future<void> getQuantityDetails()async{
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
*/
