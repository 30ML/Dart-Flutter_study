// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_search_app/data/photo_provider.dart';

import 'package:image_search_app/model/photo.dart';
import 'package:image_search_app/ui/widget/photo_widget.dart';
// import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();
  // PROBLEM(P3): data를 담는 곳이 UI를 담당하는 widget 안에 있음.
  // List<Photo> _photos = [];

  // PROBLEM(P1): HomeScreen 위젯과 fetchPhoto 기능이 섞여 둘 중 하나만 수정이 필요해도 이 파일은 수정되어야 함.
  // Future<List<Photo>> fetchPhoto(String query) async { // CODE(P1)
  //   final response = await http.get(
  //     Uri.parse(
  //         'https://pixabay.com/api/?key=24829672-e86462931ca2f2cf80fb27137&q=$query&image_type=photo'),
  //   );
  //   Map<String, dynamic> jsonResponse = jsonDecode(response.body);
  //   Iterable hits = jsonResponse['hits'];

  //   return hits.map((e) => Photo.fromMap(e)).toList();
  // }

  // PROBLEM(P1 -> P2): 아래 code로 인해 HomeScreen 화면 은 PixabayApi가 있어야만 돌아가는 code가 됨.
  // 즉, 아래 code 없이는 사용할 수 없음.
  // final pixabayApi = PixabayApi(); // CODE(P2)

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final photoProvider = PhotoProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Image Search App',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () async {
                    photoProvider.fetch(_controller.text);
                  },
                ),
              ),
            ),
          ),
          StreamBuilder<List<Photo>>(
            stream: photoProvider.photoStream,
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? const CircularProgressIndicator()
                  : Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: snapshot.data!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemBuilder: (context, index) {
                          return PhotoWidget(photo: snapshot.data![index]);
                        },
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
