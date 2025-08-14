import 'package:dio/dio.dart';

import 'api/detail_api.dart';
import 'api/group_api.dart';
import 'api/journal_api.dart';
import 'api/store_api.dart';
import 'api/tag_api.dart';
import 'api/user_api.dart';
class ApiClient{
   final Dio _dio = Dio();
   late final UserApi user;
   late final StoreApi store;
   late final GroupApi group;
   late final DetailApi detail;
   late final JournalApi journal;
   late final TagApi tag;


   ApiClient(){
      //настраиваем базовые характеристики
      _dio.options.baseUrl = 'http://ваш сервер.ru';
      _dio.options.connectTimeout = Duration(seconds: 30);
      _dio.options.receiveTimeout = Duration(seconds: 30);

      // Добавляем перехватчик для логирования (как журналист)
      _dio.interceptors.add(LogInterceptor(
         requestBody: true,
         responseBody: true,
         error: true,
      ));


      user = UserApi(_dio);
      store = StoreApi(_dio);
      group = GroupApi(_dio);
      detail = DetailApi(_dio);
      journal = JournalApi(_dio);
      tag = TagApi(_dio);

   }
}