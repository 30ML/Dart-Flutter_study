import 'package:create_a_shimmer_loading_effect/list_item/card_list_item.dart';
import 'package:create_a_shimmer_loading_effect/list_item/circle_list_item.dart';
import 'package:create_a_shimmer_loading_effect/shimmer/shimmer.dart';
import 'package:create_a_shimmer_loading_effect/shimmer/shimmer_loading.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shimmer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shimmer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 20,
              ),
              child: Row(
                children: List.generate(
                  5,
                  (index) => Row(
                    children: [
                      _buildTopRowItem(),
                      index != 4 ? const SizedBox(width: 25) : Container(),
                    ],
                  ),
                ),
              ),
            ),
            _buildListItem(),
            _buildListItem(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isLoading = !_isLoading;
          });
        },
        child: Icon(
          _isLoading
              ? Icons.hourglass_bottom_outlined
              : Icons.hourglass_full_outlined,
        ),
      ),
    );
  }

  Widget _buildTopRowItem() {
    return ShimmerLoading(
      isLoading: _isLoading,
      child: const CircleListItem(),
    );
  }

  Widget _buildListItem() {
    return ShimmerLoading(
      isLoading: _isLoading,
      child: CardListItem(isLoading: _isLoading),
    );
  }
}
