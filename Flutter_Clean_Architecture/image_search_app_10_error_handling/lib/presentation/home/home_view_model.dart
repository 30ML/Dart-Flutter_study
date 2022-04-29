// PixabayApi를 가지고 무언가는 하는 파일

// import 'dart:async';

import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:image_search_app_10_error_handling/data/data_source/result.dart';
import 'package:image_search_app_10_error_handling/domain/repository/photo_api_repository.dart';
import 'package:image_search_app_10_error_handling/domain/model/photo.dart';
import 'package:image_search_app_10_error_handling/presentation/home/home_ui_event.dart';

class HomeViewModel with ChangeNotifier {
  final PhotoApiRepository repository;
  List<Photo> _photos = [];

  UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos);
  // UnmodifiableListView -> .add(), remove(), clear() 등 수정 method 사용할 수 없음.

  final _eventController = StreamController<HomeUiEvent>();
  Stream<HomeUiEvent> get eventStream => _eventController.stream;

  HomeViewModel(this.repository);

  void fetch(String query) async {
    final Result<List<Photo>> result = await repository.fetch(query);

    result.when(
      success: (photos) {
        _photos = photos;

        notifyListeners();
      },
      error: (message) {
        print(message);
        _eventController.add(HomeUiEvent.showSnackBar(message));
      },
    );
  }
}
