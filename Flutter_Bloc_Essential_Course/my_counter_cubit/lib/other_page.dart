import 'package:flutter/material.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Other'),
      ),
      body: Center(
        child: const Text(
          'Other',
          style: TextStyle(fontSize: 52),
        ),
      ),
    );
  }
}
