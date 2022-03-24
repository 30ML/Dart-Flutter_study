import 'package:air_pollution_app_bloc/bloc/air_bloc.dart';
import 'package:air_pollution_app_bloc/model/air_result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Bloc 객체를 최상위에서 가져옴.
final airBloc = AirBloc();

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
      body: StreamBuilder<AirResult>(
          stream: airBloc.airResult$,
          builder: (context, snapshot) {
            return Center(
              /* 1 */
              child: !snapshot.hasData
                  ? const CircularProgressIndicator()
                  : _card(snapshot.data!),

              /* 2 */
              // child: snapshot.connectionState == ConnectionState.waiting
              //     ? const CircularProgressIndicator()
              //     : _card(snapshot.data!),
            );
          }),
    );
  }

  Widget _card(AirResult airData) {
    return Padding(
      padding: const EdgeInsets.all(12),
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
                  color: getColor(airData),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(Icons.insert_emoticon),
                      Text(
                        '${airData.data.current.pollution.aqius}',
                        style: const TextStyle(fontSize: 40),
                      ),
                      Text(
                        getString(airData),
                        style: const TextStyle(fontSize: 20),
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
                            'https://airvisual.com/images/${airData.data.current.weather.ic}.png',
                            width: 32,
                            height: 32,
                          ),
                          const SizedBox(width: 16),
                          Text('${airData.data.current.weather.tp}')
                        ],
                      ),
                      Row(
                        children: [
                          const Text('습도'),
                          const SizedBox(width: 5),
                          Text('${airData.data.current.weather.hu}%'),
                        ],
                      ),
                      Row(
                        children: [
                          const Text('풍속'),
                          const SizedBox(width: 5),
                          Text('${airData.data.current.weather.ws}m/s'),
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
                airBloc.fetch();
              },
            ),
          ),
        ],
      ),
    );
  }

  Color getColor(AirResult airData) {
    if (airData.data.current.pollution.aqius < 50) {
      return Colors.greenAccent;
    } else if (airData.data.current.pollution.aqius < 100) {
      return Colors.yellow;
    } else if (airData.data.current.pollution.aqius < 150) {
      return Colors.orange;
    } else {
      return Colors.redAccent;
    }
  }

  String getString(AirResult airData) {
    if (airData.data.current.pollution.aqius < 50) {
      return '좋음';
    } else if (airData.data.current.pollution.aqius < 100) {
      return '보통';
    } else if (airData.data.current.pollution.aqius < 150) {
      return '나쁨';
    } else {
      return '최악';
    }
  }
}
