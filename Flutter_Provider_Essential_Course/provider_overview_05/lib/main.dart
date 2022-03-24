import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_overview_05/model/dog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Dog>(
      create: (context) => Dog(name: 'Dog05', breed: 'Breed05', age: 3),
      child: MaterialApp(
        title: 'Provider Overview 05',
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
        title: const Text('Provider Overview 05'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              /* context.watch 예시 */
              // '- name: ${Provider.of<Dog>(context, listen: false).name}',
              '- name: ${context.watch<Dog>().name}', // 사실 context.read()가 더 효율적임.
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
          /* context.select 예시 */
          // '- breed: ${Provider.of<Dog>(context, listen: false).breed}',
          '- breed: ${context.select<Dog, String>((Dog dog) => dog.breed)}',
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
          /* context.select 예시 */
          // '- age: ${Provider.of<Dog>(context).age}',
          '- age: ${context.select<Dog, int>((Dog dog) => dog.age)}',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            /* context.read 예시 */
            // Provider.of<Dog>(context, listen: false).grow();
            context.read<Dog>().grow();
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
