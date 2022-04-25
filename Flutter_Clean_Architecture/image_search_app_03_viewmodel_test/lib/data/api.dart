import 'dart:convert';

import 'package:image_search_app_03_viewmodel_test/model/photo.dart';
import 'package:http/http.dart' as http;

class PixabayApi {
  static const baseURL = 'https://pixabay.com/api/';
  final key = '24829672-e86462931ca2f2cf80fb27137';

  Future<List<Photo>> fetchPhoto(String query) async {
    final response = await http.get(
      Uri.parse('$baseURL?key=$key&q=$query&image_type=photo'),
    );
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];

    return hits.map((e) => Photo.fromMap(e)).toList();
  }
}
