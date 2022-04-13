import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String email;

  User({
    required this.id,
    required this.name,
    required this.email,
  });

  @override
  List<Object?> get props => [id, name, email];
  // Equatable은 props getter가 return하는 List에 포함된 element들이 같으면, 같은 object라고 판단함.

  @override
  bool get stringify => true;
  // stringify getter를 override하여 true를 return 하도록 만들어주어야 toString()를 사용할 수 있음.
}
