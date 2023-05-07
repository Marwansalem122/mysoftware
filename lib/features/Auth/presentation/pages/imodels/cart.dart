import 'package:flutter/cupertino.dart';
import 'package:mysoftwareproject/features/Auth/presentation/pages/imodles/item.dart';

class Cart extends ChangeNotifier{
  List<Item>_items=[];
  double _totalPrice=0.0;
  void add(Item item){
    _items.add(item);
    _totalPrice+=item.price!;
    notifyListeners();
  }
  void remove(Item item){
    _totalPrice-=item.price!;
    _items.remove(item);
    notifyListeners();
  }
  int get count {
    return _items.length;
  }
  double get totalprice{
    return _totalPrice;
  }
  List<Item> get basketItems{
    return _items;
  }
}