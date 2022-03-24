import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pkg/item.dart';

enum CartEventType {
  add,
  remove,
}

class CartEvent {
  final CartEventType type;
  final Item item;

  CartEvent(this.type, this.item);
}

class CartBloc extends Bloc<CartEvent, List<Item>> {
  CartBloc() : super([]);

  @override
  void on<E extends CartEvent>(EventHandler<E, List<Item>> handler, {EventTransformer<E>? transformer}) {
    // TODO: implement on
  }
}
