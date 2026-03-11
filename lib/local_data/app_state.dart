import 'package:flutter/foundation.dart';
import 'package:ashalet_plov_bomba/local_data/models/asian_food.dart';

class AppState extends ChangeNotifier {
  // Singleton pattern for simple global access
  static final AppState _instance = AppState._internal();
  factory AppState() => _instance;
  AppState._internal();

  final List<String> _favoriteIds = [];
  final List<AsianFoodModel> _cartItems = [];

  List<String> get favoriteIds => _favoriteIds;
  List<AsianFoodModel> get cartItems => _cartItems;

  bool isFavorite(String id) {
    return _favoriteIds.contains(id);
  }

  void toggleFavorite(String id) {
    if (_favoriteIds.contains(id)) {
      _favoriteIds.remove(id);
    } else {
      _favoriteIds.add(id);
    }
    notifyListeners();
  }

  void addToCart(AsianFoodModel item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(AsianFoodModel item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  double get cartTotal {
    return _cartItems.fold(0, (sum, item) => sum + item.price);
  }

  int get cartCaloriesTotal {
    return _cartItems.fold(0, (sum, item) => sum + item.calories);
  }
}
