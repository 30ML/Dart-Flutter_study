import 'package:flutter/material.dart';
import 'package:image_search_app/data/api.dart';
import 'package:image_search_app/data/photo_provider.dart';
import 'package:image_search_app/ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // SOLUTION(P2): class들끼리 사용할 때 결합되어 있는 결합도를 느슨하게 하는 방법 중 하나는
      // 외부에서 생성된 instance 받아서 사용하는 것임.
      // PixabayApi를 외부에서 생성해서 받아서 사용하는 것 좀더 좋은 형태일 수 있음.
      home: PhotoProvider(
        api: PixabayApi(),
        child: const HomeScreen(),
      ),
    );
  }
}
