import 'dart:convert';

import 'package:http/http.dart' as http;

class PixabayApi {
  final http.Client client;

  PixabayApi(this.client);

  static const baseURL = 'https://pixabay.com/api/';
  static const key = '24829672-e86462931ca2f2cf80fb27137';

  // Response, Map 등 여러 형태로 주어도 무관.
  Future<Iterable> fetch(String query) async {
    final response = await client
        .get(Uri.parse('$baseURL?key=$key&q=$query&image_type=photo'));
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];

    return hits;
  }
}
