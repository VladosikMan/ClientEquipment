import 'package:dio/dio.dart';
class DetailApi {
  final Dio _dio;
  final API_URL = "/api/details";
  DetailApi(this._dio);

  Future<Response> createDetail(Map<String, dynamic> detailData) async =>
      _dio.post('$API_URL/create', data: detailData);

  Future<Response> deleteDetailByArticle(String article) async =>
      _dio.delete('$API_URL/article/$article');

  Future<Response> deleteDetailById(String id) async =>
      _dio.delete('$API_URL/$id');

  Future<Response> updateDetail(String id, Map<String, dynamic> detailData) async =>
      _dio.post('$API_URL/update/$id', data: detailData);

  Future<Response> getDetail(String id) async =>
      _dio.get('$API_URL/$id');

  Future<Response> getAllDetails() async =>
      _dio.get('$API_URL/');

  Future<Response> getLengthDetails()async =>
      _dio.get('$API_URL/length');
}
