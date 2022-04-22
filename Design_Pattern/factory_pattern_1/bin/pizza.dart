enum PizzaType { hamMushroom, deluxe, seafood }

// abstract class Pizza {
//   double getPrice();
// }

abstract class Pizza {
  double getPrice();

  static pizzaFactory(PizzaType type) {
    switch (type) {
      case PizzaType.hamMushroom:
        return HamAndMushroomPizza();
      case PizzaType.deluxe:
        return DeluxePizza();
      case PizzaType.seafood:
        return SeafoodPizza();
    }
  }
}

class HamAndMushroomPizza implements Pizza {
  double price = 8.5;

  @override
  double getPrice() {
    return price;
  }
}

class DeluxePizza implements Pizza {
  double price = 10.5;

  @override
  double getPrice() {
    return price;
  }
}

class SeafoodPizza implements Pizza {
  double price = 11.5;

  @override
  double getPrice() {
    return price;
  }
}
