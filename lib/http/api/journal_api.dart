import 'package:dio/dio.dart';

class JournalApi {
  final Dio _dio;
  final API_URL = "/api/journal";
  JournalApi(this._dio);

  Future<Response> createJournal(Map<String, dynamic> journalData) async =>
      _dio.post('$API_URL/create', data: journalData);

  Future<Response> deleteJournalById(String id) async =>
      _dio.delete('$API_URL/$id');

  Future<Response> updateJournal(String id, Map<String, dynamic> journalData) async =>
      _dio.post('$API_URL/update/$id', data: journalData);

  Future<Response> getJournal(String id) async =>
      _dio.get('$API_URL/$id');

  Future<Response> getAllJournals() async =>
      _dio.get('$API_URL/');
}
