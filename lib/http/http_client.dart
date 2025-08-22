import 'package:dio/dio.dart';

import '../values/strings/app_strings.dart';
import 'api/detail_api.dart';
import 'api/group_api.dart';
import 'api/journal_api.dart';
import 'api/store_api.dart';
import 'api/tag_api.dart';
import 'api/user_api.dart';

class ApiClient {
  final Dio _dio = Dio();
  late final UserApi _user;
  late final StoreApi _store;
  late final GroupApi _group;
  late final DetailApi _detail;
  late final JournalApi _journal;
  late final TagApi _tag;

  // синглктон объект
  static final ApiClient _instance = ApiClient._internal();

  factory ApiClient() {
    return _instance;
  }

  ApiClient._internal() {
    _settingsApiClient();
  }

  void _settingsApiClient() {
    //настраиваем базовые характеристики
    _dio.options.baseUrl = '$BASE_URL';
    _dio.options.connectTimeout = Duration(seconds: 30);
    _dio.options.receiveTimeout = Duration(seconds: 30);

    // Добавляем перехватчик для логирования (как журналист)
    _dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true, error: true),
    );

    _user = UserApi(_dio);
    _store = StoreApi(_dio);
    _group = GroupApi(_dio);
    _detail = DetailApi(_dio);
    _journal = JournalApi(_dio);
    _tag = TagApi(_dio);
  }

  Future<Response> getSimpleRequest(String req) async{
    try {
      // Выполняем GET-запрос по пути '/about'
      final response = await _dio.get(req);
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
