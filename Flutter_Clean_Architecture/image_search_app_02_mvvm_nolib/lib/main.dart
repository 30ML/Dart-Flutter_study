import 'package:flutter/material.dart';
import 'package:image_search_app_02_mvvm_nolib/data/api.dart';
import 'package:image_search_app_02_mvvm_nolib/data/photo_provider.dart';
import 'package:image_search_app_02_mvvm_nolib/ui/home_screen.dart';
import 'package:image_search_app_02_mvvm_nolib/ui/home_view_model.dart';

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
      home: PhotoProvider(
        viewModel: HomeViewModel(PixabayApi()),
        child: const HomeScreen(),
      ),
    );
  }
}
