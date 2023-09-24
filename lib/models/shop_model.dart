import 'package:flutter/material.dart';
import 'package:sushi_restaurant/models/food_model.dart';

class ShopModel extends ChangeNotifier {
  // food menu
  final List<FoodModel> _foodMenu = [
    FoodModel(
      name: "Salman Sushi",
      price: "21",
      imagePath: 'assets/image_3.png',
      rating: "4.9",
    ),
    FoodModel(
      name: "Tuna",
      price: "23",
      imagePath: 'assets/image_1.png',
      rating: "4.3",
    ),
  ];

  // customer cart
  final List<FoodModel> _cart = [];

  // getter methods
  List<FoodModel> get foodMenu => _foodMenu;
  List<FoodModel> get cart => _cart;

  // add to cart
  void addToCart(FoodModel foodModel, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodModel);
      notifyListeners();
    }
  }

  // remove from cart
  void removeFromCart(FoodModel foodModel) {
    _cart.remove(foodModel);
    notifyListeners();
  }
}
