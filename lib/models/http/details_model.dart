import 'package:flutter/cupertino.dart';

import '../../http/http_client.dart';

class DetailsModel with ChangeNotifier{
  //количество деталей
  int length = 0;
  Future<void> getLengthDetails()async{
    try {
      final response = await ApiClient().detail.getLengthDetails();
      if(response.statusCode == 200){
        length =int.parse(response.data);
      }else{
      }
    } catch (e) {
    //e.toString();

    } finally {
      notifyListeners(); // Снова уведомляем об изменениях
    }
  }
}
