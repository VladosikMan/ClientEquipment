import 'package:dio/dio.dart';

class StoreApi {
  final Dio _dio;
  StoreApi(this._dio);
  final API_URL = "/api/store";


  Future<Response> createStore(Map<String, dynamic> storeData) async =>
      _dio.post('$API_URL/create', data: storeData);

  Future<Response> deleteStoreByName(String name) async =>
      _dio.delete('$API_URL/name/$name');

  Future<Response> deleteStoreById(String id) async =>
      _dio.delete('$API_URL/$id');

  Future<Response> updateStore(String id, Map<String, dynamic> storeData) async =>
      _dio.post('$API_URL/update/$id', data: storeData);

  Future<Response> getStore(String id) async =>
      _dio.get('$API_URL/$id');

  Future<Response> getAllStores() async =>
      _dio.get('$API_URL/');

  Future<Response> getLengthStore()async =>
      _dio.get('$API_URL/length');
}
