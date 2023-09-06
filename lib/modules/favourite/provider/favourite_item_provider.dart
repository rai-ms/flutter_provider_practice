import 'package:flutter/cupertino.dart';

class FavouriteItemProvider extends ChangeNotifier
{
  List<int> _selectedItem = [];
  List<int> get selectedItem => _selectedItem;
  void addItem(int value)
  {
    _selectedItem.add(value);
    notifyListeners();
  }

  void removeItem(int value)
  {
    if(_selectedItem.contains(value)) {
      {
        _selectedItem.remove(value);
        notifyListeners();
      }
    }
  }

  bool isContainItem(int value)
  {
    return _selectedItem.contains(value) == true;
  }

  int getItemCount()
  {
    return _selectedItem.length;
  }
}