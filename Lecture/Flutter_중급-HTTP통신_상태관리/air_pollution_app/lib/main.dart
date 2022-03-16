import 'package:flutter/material.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '현재 위치 미세먼지',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 16),
              Card(
                child: Column(
                  children: [
                    Container(
                      color: Colors.yellow,
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Icon(Icons.insert_emoticon),
                          Text(
                            '80',
                            style: TextStyle(
                              fontSize: 40,
                            ),
                          ),
                          Text(
                            '보통',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.insert_emoticon),
                              SizedBox(width: 16),
                              Text('11°')
                            ],
                          ),
                          Row(
                            children: const [
                              Text('습도'),
                              SizedBox(width: 5),
                              Text('100%'),
                            ],
                          ),
                          Row(
                            children: const [
                              Text('풍속'),
                              SizedBox(width: 5),
                              Text('5.7m/s'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              ClipRRect(
                // 둥글게 만들기
                borderRadius: BorderRadius.circular(50),
                child: MaterialButton(
                  child: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                  ),
                  color: Colors.orange,
                  padding: const EdgeInsets.symmetric(
                    // ClipRRect()의 child에 padding을 주면 깔끔해짐
                    horizontal: 40,
                    vertical: 15,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
