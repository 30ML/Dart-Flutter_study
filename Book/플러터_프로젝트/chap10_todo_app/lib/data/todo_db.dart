class TodoDb {
  // database를 두 번 이상 여는 것은 합리적이므로, TodoDb class는 singleton이어야 함.
  // singleton
  static final TodoDb _singleton = TodoDb._internal();

  // private internal constructor
  TodoDb._internal();

  factory TodoDb() {
    return _singleton;
  }
}
