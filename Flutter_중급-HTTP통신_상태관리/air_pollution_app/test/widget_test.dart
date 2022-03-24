import 'dart:convert';

import 'package:air_pollution_app/model/air_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  test('http 통신 test', () async {
    Uri url = Uri.parse(
        'http://api.airvisual.com/v2/nearest_city?key=5bd2e943-8112-49f8-849b-8fed1e034095');
    var response = await http.get(url);
    expect(response.statusCode, 200);

    AirResult result = AirResult.fromJson(json.decode(response.body));
    expect(result.status, 'success');
  });
}
