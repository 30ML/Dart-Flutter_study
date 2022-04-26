// PixabayApi를 가지고 무언가는 하는 파일

import 'dart:async';

import 'package:image_search_app_07_provider/data/photo_api_repository.dart';
import 'package:image_search_app_07_provider/model/photo.dart';

class HomeViewModel {
  // final PixabayApi api;
  final PhotoApiRepository repository;

  final _photoStreamController = StreamController<List<Photo>>()..add([]);
  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  HomeViewModel(
    this.repository,
  );

  void fetch(String query) async {
    final result = await repository.fetch(query);
    _photoStreamController.add(result);
  }
}
