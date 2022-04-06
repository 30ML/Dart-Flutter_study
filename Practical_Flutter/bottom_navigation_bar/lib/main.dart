import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentPage = 0;
  final List<Widget> _pages = [
    const Text('Page 1 - Announcements'),
    const Text('Page 2 - Birthdays'),
    const Text('Page 3 - Data'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BottomNavigationBar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: _pages.elementAt(_currentPage),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPage,
          fixedColor: Colors.red,
          onTap: (index) {
            setState(() => _currentPage = index);
          },
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.redAccent,
              icon: Icon(Icons.announcement),
              label: 'Announcements',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cake),
              label: 'Birthdays',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cloud),
              label: 'Data',
            ),
          ],
        ),
      ),
    );
  }
}
