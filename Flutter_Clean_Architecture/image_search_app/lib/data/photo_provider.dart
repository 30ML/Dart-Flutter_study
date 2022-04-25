// Photo Inherited Widget

import 'package:flutter/material.dart';
import 'package:image_search_app/data/api.dart';

// InheritedWidget: 어떤 widget에도 원하는 데이터를 꽂아줄 수 있는 특별한 widget.
// 원하는 widget에다가 원하는 객체를 전달하게 해줌.
class PhotoProvider extends InheritedWidget {
  final PixabayApi api;

  const PhotoProvider({
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

  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return oldWidget.api != api;
  }
}
