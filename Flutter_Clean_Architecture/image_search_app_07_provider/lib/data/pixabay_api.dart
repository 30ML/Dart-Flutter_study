import 'dart:convert';

import 'package:image_search_app_07_provider/data/photo_api_repository.dart';
import 'package:image_search_app_07_provider/model/photo.dart';
import 'package:http/http.dart' as http;

class PixabayApi implements PhotoApiRepository {
  static const baseURL = 'https://pixabay.com/api/';
  static const key = '24829672-e86462931ca2f2cf80fb27137';

  @override
  Future<List<Photo>> fetch(String query, {http.Client? client}) async {
    // if (client == null) {
    //   client = http.Client();
    // }
    client ??= http.Client();

    // final response = await http.get(
    final response = await client.get(
      Uri.parse('$baseURL?key=$key&q=$query&image_type=photo'),
    );
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];

    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}
