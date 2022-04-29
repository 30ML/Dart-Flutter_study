import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_search_app_10_error_handling/data/data_source/result.dart';

class PixabayApi {
  final http.Client client;

  PixabayApi(this.client);

  static const baseURL = 'https://pixabay.com/api/';
  static const key = '24829672-e86462931ca2f2cf80fb27137';

  // Response, Map 등 여러 형태로 주어도 무관.
  Future<Result<Iterable>> fetch(String query) async {
    try {
      final response = await client
          .get(Uri.parse('$baseURL?key=$key&q=$query&image_type=photo'));
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      Iterable hits = jsonResponse['hits'];

      return Result.success(hits);
    } catch (e) {
      return const Result.error('Network Error');
    }
  }
}
