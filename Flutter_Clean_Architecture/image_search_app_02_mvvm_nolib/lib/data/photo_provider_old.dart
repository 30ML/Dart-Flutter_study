import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_search_app_02_mvvm_nolib/data/api.dart';
import 'package:image_search_app_02_mvvm_nolib/model/photo.dart';

class PhotoProvider extends InheritedWidget {
  /* 아래 code는 MVVM에서 ViewModel에 해당 */
  final PixabayApi api; // VM

  final _photoStreamController = StreamController<List<Photo>>()..add([]); // VM
  Stream<List<Photo>> get photoStream => _photoStreamController.stream; // VM

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

  // VM
  void fetch(String query) async {
    final result = await api.fetchPhoto(query);
    _photoStreamController.add(result);
  }

  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return oldWidget.api != api;
  }
}
