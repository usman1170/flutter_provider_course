import 'package:flutter/material.dart';

class FavouriteProvider with ChangeNotifier {
  List<int> _favItems = [];
  List<int> get favItems => _favItems;
  void addFavourite(int index) {
    _favItems.add(index);
    notifyListeners();
  }

  void removeFavourite(int index) {
    _favItems.remove(index);
    notifyListeners();
  }
}
