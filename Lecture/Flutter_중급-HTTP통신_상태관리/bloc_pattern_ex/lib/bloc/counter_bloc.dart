import 'package:rxdart/rxdart.dart';

class CounterBloc {
  // Data
  int _count = 0;

  final _countSubject = BehaviorSubject<int>.seeded(0);

  // Logic
  void addCounter() {
    _count++;
    _countSubject.add(_count);
  }

  Stream<int> get count$ => _countSubject.stream;
}
