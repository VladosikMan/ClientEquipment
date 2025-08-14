import 'package:dio/dio.dart';

class TagApi {
  final Dio _dio;
  final API_URL = "/api/tag";
  TagApi(this._dio);

  Future<Response> createTag(Map<String, dynamic> tagData) async =>
      _dio.post('$API_URL/create', data: tagData);

  Future<Response> deleteTagByName(String name) async =>
      _dio.delete('$API_URL/name/$name');

  Future<Response> deleteTagById(String id) async =>
      _dio.delete('$API_URL/$id');

  Future<Response> updateTag(String id, Map<String, dynamic> tagData) async =>
      _dio.post('$API_URL/update/$id', data: tagData);

  Future<Response> getTag(String id) async =>
      _dio.get('$API_URL/$id');

  Future<Response> getAllTags() async =>
      _dio.get('$API_URL/');
}
