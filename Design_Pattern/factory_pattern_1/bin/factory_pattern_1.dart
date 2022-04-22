import 'pizza.dart';

void main(List<String> arguments) {
  PizzaType userWantPizza = PizzaType.deluxe;
  Pizza pizza;

  switch (userWantPizza) {
    case PizzaType.hamMushroom:
      pizza = HamAndMushroomPizza();
      break;
    case PizzaType.deluxe:
      pizza = DeluxePizza();
      break;
    case PizzaType.seafood:
      pizza = SeafoodPizza();
      break;
  }

  print(pizza.getPrice());
}
