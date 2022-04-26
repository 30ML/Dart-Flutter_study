// PixabayApi를 가지고 무언가는 하는 파일

// import 'dart:async';

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:image_search_app_09_clean_architecture/domain/repository/photo_api_repository.dart';
import 'package:image_search_app_09_clean_architecture/domain/model/photo.dart';

class HomeViewModel with ChangeNotifier {
  final PhotoApiRepository repository;

  // final _photoStreamController = StreamController<List<Photo>>()..add([]);
  // Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  List<Photo> _photos = [];

  // List<Photo> get photos => this._photos;

  UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos);
  // UnmodifiableListView -> .add(), remove(), clear() 등 수정 method 사용할 수 없음.

  HomeViewModel(
    this.repository,
  );

  void fetch(String query) async {
    final result = await repository.fetch(query);
    // _photoStreamController.add(result);
    _photos = result;
    notifyListeners();
  }
}
