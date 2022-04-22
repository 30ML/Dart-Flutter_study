// SOLUTION(P1): 기능 분리(1) - 최상위 함수로 만들기
// 최상위 함수를 두는 것이 좋은 방법은 아님.
// 자주 사용하는 util성 기능이 아니라면 별도의 class를 작성하는 것이 좋음.

import 'dart:convert';

import 'package:image_search_app/model/photo.dart';
import 'package:http/http.dart' as http;

Future<List<Photo>> fetchPhoto(String query) async {
  final response = await http.get(
    Uri.parse(
        'https://pixabay.com/api/?key=24829672-e86462931ca2f2cf80fb27137&q=$query&image_type=photo'),
  );
  Map<String, dynamic> jsonResponse = jsonDecode(response.body);
  Iterable hits = jsonResponse['hits'];

  return hits.map((e) => Photo.fromMap(e)).toList();
}
