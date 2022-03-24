import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_overview_04/model/dog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Dog>(
      create: (context) => Dog(name: 'Dog04', breed: 'Breed04'),
      child: MaterialApp(
        title: 'Provider Overview 04',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Overview 04'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '- name: ${Provider.of<Dog>(context, listen: false).name}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            BreedAndAge(),
          ],
        ),
      ),
    );
  }
}

class BreedAndAge extends StatelessWidget {
  const BreedAndAge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '- breed: ${Provider.of<Dog>(context, listen: false).breed}',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 10),
        Age(),
      ],
    );
  }
}

class Age extends StatelessWidget {
  const Age({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '- age: ${Provider.of<Dog>(context).age}',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Provider.of<Dog>(context, listen: false).grow();
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
