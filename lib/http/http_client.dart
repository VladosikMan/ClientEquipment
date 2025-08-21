import 'package:dio/dio.dart';

import '../values/strings/app_strings.dart';
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

   // синглктон объект


   static final ApiClient _instance = ApiClient._internal();
   factory ApiClient() {
      print("Получаем");
      return _instance;
   }
   ApiClient._internal() {
      _settingsApiClient();
   }



   void test(){
      print("Тест");
   }
   void _settingsApiClient(){
      print("Инитим");
      //настраиваем базовые характеристики
      _dio.options.baseUrl = '$BASE_URL';
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

   Future<Response> getAboutInfo() async {
      try {
         // Выполняем GET-запрос по пути '/about'
         final response = await _dio.get('/about');

         // Возвращаем ответ сервера
         return response;
      } on DioException catch (e) {
         // Обрабатываем специфические ошибки Dio
         if (e.response != null) {
            // Сервер ответил с ошибкой (4xx, 5xx)
            //  print('Ошибка сервера: ${e.response?.statusCode}');
         } else {
            // Проблемы с соединением (таймаут, нет интернета)
            //   print('Ошибка сети: ${e.message}');
         }
         rethrow; // Перебрасываем исключение дальше
      } catch (e) {
         // Ловим любые другие исключения
         // print('Неизвестная ошибка: $e');
         rethrow;
      }
   }
}