import 'dart:convert';

import 'package:air_pollution_app_bloc/model/air_result.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

class AirBloc {
  final _airSubject = BehaviorSubject<AirResult>();

  AirBloc() {
    fetch();
  }

  // Clean Architecture로 간다면, fetchData()는 repository로 가게됨.
  Future<AirResult> fetchData() async {
    // _airSubject.add(null); // error
    // TODO: loading 상태 확인 로직은 어떻게 만드는가?
    print('FETCH DATA');

    Uri uri = Uri.parse(
        'http://api.airvisual.com/v2/nearest_city?key=5bd2e943-8112-49f8-849b-8fed1e034095');
    var response = await http.get(uri);
    AirResult result = AirResult.fromJson(json.decode(response.body));

    // indicator 표시용 Future.delayed
    await Future.delayed(const Duration(seconds: 2));

    return result;
  }

  void fetch() async {
    AirResult airResult = await fetchData();
    _airSubject.add(airResult);
  }

  Stream<AirResult> get airResult$ => _airSubject.stream;
}
