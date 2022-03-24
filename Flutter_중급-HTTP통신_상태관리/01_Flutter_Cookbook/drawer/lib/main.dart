import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer',
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, // StatusBar 까지 색상 적용
          // padding: EdgeInsets.only(), // 위와 같음
          children: [
            const DrawerHeader(
              child: Text('Header'),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // something to do
                Navigator.pop(context); // Drawer는 화면을 상단에 쌓는 것과 같음
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // something to do
                Navigator.pop(context); // Drawer는 화면을 상단에 쌓는 것과 같음
              },
            ),
            ListTile(
              title: const Text('Item 3'),
              onTap: () {
                // something to do
                Navigator.pop(context); // Drawer는 화면을 상단에 쌓는 것과 같음
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(),
      ),
    );
  }
}
