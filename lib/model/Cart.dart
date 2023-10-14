import 'package:add_to_cart/model/Item.dart';
import 'package:flutter/material.dart';


class Cart extends ChangeNotifier {
  List<Item> _items = [];
  double _price = 0.0;
  void add(Item item) {
    _items.add(item);
    _price += item.price;
    notifyListeners();

  }
   void delet(Item item) {
    _items.remove(item);
    _price -= item.price;
    notifyListeners();
  }
   int get count{
     
     return _items.length;
   }
   double get totalPrice {
    return _price  ;
  }

   List<Item>  get basket {
    return _items;
  }
  
}
