import 'package:dio/dio.dart';

class UserApi {
  final Dio _dio;
  final API_URL = "/api/user";
  UserApi(this._dio);

  // Добавить пользователя
  Future<Response> createUser(Map<String, dynamic> userData) async {
    return _dio.post('$API_URL/create', data: userData);
  }

  // Удалить по имени
  Future<Response> deleteUserByName(String name) async {
    return _dio.delete('$API_URL/name/$name');
  }

  // Удалить по ID
  Future<Response> deleteUserById(String id) async {
    return _dio.delete('$API_URL/$id');
  }

  // Обновить по ID
  Future<Response> updateUser(String id, Map<String, dynamic> userData) async {
    return _dio.post('$API_URL/update/$id', data: userData);
  }

  // Получить по ID
  Future<Response> getUser(String id) async {
    return _dio.get('$API_URL/$id');
  }

  // Получить всех
  Future<Response> getAllUsers() async {
    return _dio.get('$API_URL/');
  }
}