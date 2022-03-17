import 'dart:convert';

import 'package:air_pollution_app/model/air_result.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

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
  AirResult? _result;

  Future<AirResult> fetchData() async {
    setState(() {
      _result = null;
    });

    Uri uri = Uri.parse(
        'http://api.airvisual.com/v2/nearest_city?key=5bd2e943-8112-49f8-849b-8fed1e034095');
    var response = await http.get(uri);
    AirResult result = AirResult.fromJson(json.decode(response.body));

    await Future.delayed(const Duration(seconds: 2));

    return result;
  }

  @override
  void initState() {
    fetchData().then((airResult) {
      setState(() {
        _result = airResult;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _result == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
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
                            color: getColor(_result),
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Icon(Icons.insert_emoticon),
                                Text(
                                  '${_result!.data.current.pollution.aqius}',
                                  style: const TextStyle(fontSize: 40),
                                ),
                                Text(
                                  getString(_result),
                                  style: TextStyle(fontSize: 20),
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
                                  children: [
                                    Image.network(
                                      'https://airvisual.com/images/${_result!.data.current.weather.ic}.png',
                                      width: 32,
                                      height: 32,
                                    ),
                                    const SizedBox(width: 16),
                                    Text('${_result!.data.current.weather.tp}')
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text('습도'),
                                    const SizedBox(width: 5),
                                    Text(
                                        '${_result!.data.current.weather.hu}%'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text('풍속'),
                                    const SizedBox(width: 5),
                                    Text(
                                        '${_result!.data.current.weather.ws}m/s'),
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
                        onPressed: () async {
                          await fetchData().then((airResult) {
                            setState(() {
                              _result = airResult;
                            });
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Color getColor(AirResult? result) {
    if (_result!.data.current.pollution.aqius < 50) {
      return Colors.greenAccent;
    } else if (_result!.data.current.pollution.aqius < 100) {
      return Colors.yellow;
    } else if (_result!.data.current.pollution.aqius < 150) {
      return Colors.orange;
    } else {
      return Colors.redAccent;
    }
  }

  String getString(AirResult? result) {
    if (_result!.data.current.pollution.aqius < 50) {
      return '좋음';
    } else if (_result!.data.current.pollution.aqius < 100) {
      return '보통';
    } else if (_result!.data.current.pollution.aqius < 150) {
      return '나쁨';
    } else {
      return '최악';
    }
  }
}
