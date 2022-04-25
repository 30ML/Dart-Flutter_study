// Photo Inherited Widget

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_search_app/data/api.dart';
import 'package:image_search_app/model/photo.dart';

// InheritedWidget: 어떤 widget에도 원하는 데이터를 꽂아줄 수 있는 특별한 widget.
// 원하는 widget에다가 원하는 객체를 전달하게 해줌.
class PhotoProvider extends InheritedWidget {
  final PixabayApi api;

  // SOLUTION(P3)
  final _photoStreamController = StreamController<List<Photo>>()..add([]);
  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  PhotoProvider({
    Key? key,
    required this.api,
    required Widget child,
  }) : super(key: key, child: child);

  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result =
        context.dependOnInheritedWidgetOfExactType<PhotoProvider>();

    assert(result != null, 'No PixabayApi found in context');

    return result!;
  }

  void fetch(String query) async {
    final result = await api.fetchPhoto(query);
    _photoStreamController.add(result);
  }

  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return oldWidget.api != api;
  }
}
