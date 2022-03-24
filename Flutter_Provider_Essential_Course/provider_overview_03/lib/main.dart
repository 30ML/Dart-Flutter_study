import 'package:flutter/material.dart';
import 'package:provider_overview_03/model/dog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Provider 제거
    return MaterialApp(
      title: 'Provider Overview 03',
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
  final dog = Dog(name: 'Bori', breed: 'Golden Retriever');

  @override
  void initState() {
    dog.addListener(dogListener);

    super.initState();
  }

  void dogListener() {
    print('(listener) age: ${dog.age}');
  }

  @override
  void dispose() {
    dog.removeListener(dogListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Overview 03'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '- name: ${dog.name}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            BreedAndAge(dog: dog),
          ],
        ),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  final Dog dog;

  const BreedAndAge({
    Key? key,
    required this.dog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '- breed: ${dog.breed}',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        Age(dog: dog),
      ],
    );
  }
}

class Age extends StatelessWidget {
  final Dog dog;

  const Age({
    Key? key,
    required this.dog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '- age: ${dog.age}',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            dog.grow();
          },
          child: const Text(
            'Grow',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
