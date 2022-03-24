import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snack Bar',
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
        title: const Text('Snack Bar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Builder(
              // Builder는 새로운 context를 만듦.
              builder: (context) => ElevatedButton(
                onPressed: () {
                  final snackBar = SnackBar(
                    content: const Text('메일이 삭제되었습니다.'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        // 취소 처리
                      },
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                  // ERR: Scaffold.of() called with a context that does not contain a Scaffold.
                  // Scaffold.of() 는 다른 Scaffold 안에서 사용할 수 없음.
                  // 1) Builder를 통해 context를 새로 생성하여 사용 (과거)
                  // 2) ScaffoldMessenger 사용 (현재)
                },
                child: const Text('Show SnackBar(1)'),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                final snackBar = SnackBar(
                  content: const Text('메일이 삭제되었습니다.'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      // 취소 처리
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: const Text('Show SnackBar(2)'),
            ),
          ],
        ),
      ),
    );
  }
}
