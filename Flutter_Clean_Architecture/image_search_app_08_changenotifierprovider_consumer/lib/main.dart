import 'package:flutter/material.dart';
import 'package:image_search_app_08_changenotifierprovider_consumer/data/pixabay_api.dart';
// import 'package:image_search_app_08_changenotifierprovider_consumer/data/photo_provider.dart';
import 'package:image_search_app_08_changenotifierprovider_consumer/ui/home_screen.dart';
import 'package:image_search_app_08_changenotifierprovider_consumer/ui/home_view_model.dart';
import 'package:provider/provider.dart';

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
      // home: PhotoProvider(
      //   viewModel: HomeViewModel(PixabayApi()),
      //   child: const HomeScreen(),
      // ),
      home: Provider(
        create: (_) => HomeViewModel(PixabayApi()),
        child: const HomeScreen(),
      ),
    );
  }
}
