import 'package:dio/dio.dart';

class GroupApi {
  final Dio _dio;
  final API_URL = "/api/groups";
  GroupApi(this._dio);

  Future<Response> createGroup(Map<String, dynamic> groupData) async =>
      _dio.post('$API_URL/create', data: groupData);

  Future<Response> deleteGroupByName(String name) async =>
      _dio.delete('$API_URL/name/$name');

  Future<Response> deleteGroupById(String id) async =>
      _dio.delete('$API_URL/$id');

  Future<Response> updateGroup(String id, Map<String, dynamic> groupData) async =>
      _dio.post('$API_URL/update/$id', data: groupData);

  Future<Response> getGroup(String id) async =>
      _dio.get('$API_URL/$id');

  Future<Response> getAllGroups() async =>
      _dio.get('$API_URL/');
}