import 'package:flutter/material.dart';
import 'package:flutter_task2/model/cart_model.dart';

final List<Cart> initialData =
    List.generate(50, (index) => Cart(title: "Item $index"));

class CartProvider with ChangeNotifier {
  final List<Cart> _items = initialData;
  List<Cart> get items => _items;

  final List<Cart> _mylist = [];
  List<Cart> get mylist => _mylist;

  void addToList(Cart item) {
    _mylist.add(item);
    notifyListeners();
  }

  void removeFromList(Cart item) {
    _mylist.remove(item);
    notifyListeners();
  }
}
