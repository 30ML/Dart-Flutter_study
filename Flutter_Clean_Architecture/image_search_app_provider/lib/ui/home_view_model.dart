// PixabayApi를 가지고 무언가는 하는 파일

import 'dart:async';

import 'package:image_search_app_provider/data/api.dart';
import 'package:image_search_app_provider/model/photo.dart';

class HomeViewModel {
  final PixabayApi api;

  final _photoStreamController = StreamController<List<Photo>>()..add([]);
  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  HomeViewModel(
    this.api,
  );

  void fetch(String query) async {
    final result = await api.fetchPhoto(query);
    _photoStreamController.add(result);
  }
}
