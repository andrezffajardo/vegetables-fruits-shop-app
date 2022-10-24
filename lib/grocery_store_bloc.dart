import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grocery_store_app/grocery_product.dart';

enum GroceryState {
  normal,
  details,
  cart,
}

class GroceryStoreBLoC with ChangeNotifier {
  GroceryState groceryState = GroceryState.normal;
  List<GroceryProduct> catalog = List.unmodifiable(groceryProducts);
  List<GroceryProductItem> cart = [];

  void changeToNormal() {
    groceryState = GroceryState.normal;
    notifyListeners();
  }

  void changeToCart() {
    groceryState = GroceryState.cart;
    notifyListeners();
  }

  void addProduct(GroceryProduct product) {
    for (GroceryProductItem item in cart) {
      if (item.product.name == product.name) {
        item.increment();
        notifyListeners();
        return;
      }
    }
    cart.add(GroceryProductItem(product: product));
    notifyListeners();
  }

  int totalCartElements() => cart.fold<int>(
        0,
        (previousValue, element) => previousValue + element.quantity,
      );

  double totalPriceElements() => cart.fold<double>(
        0,
        (previousValue, element) =>
            previousValue + (element.quantity * element.product.price),
      );
}

class GroceryProductItem {
  GroceryProductItem({this.quantity = 1, required this.product});
  int quantity;
  final GroceryProduct product;

  void increment() {
    quantity++;
  }

  void decrement() {}
}
