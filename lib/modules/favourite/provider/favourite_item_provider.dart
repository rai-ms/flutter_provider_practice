import 'package:flutter/cupertino.dart';

class FavouriteItemProvider extends ChangeNotifier {

  List<int> _selectedItem = [];

  List<int> get selectedItem => _selectedItem;

  /// Add item in the cart list [_selectedItem] then auto refresh 
  void addItem(int value) {
    _selectedItem.add(value);
    notifyListeners();
  }

  /// It returns the item present at the [index] position in the [_selectedItem] cart list
  int itemAt(index) {
    return _selectedItem[index];
  }

  /// It remove the item from [index] location, then reload
  void removeItem(int index) {
    if (_selectedItem.contains(index)) {
      {
        _selectedItem.remove(index);
        notifyListeners();
      }
    }
  }

  /// It returns true if [value] is present in the list
  bool isContainItem(int value) {
    return _selectedItem.contains(value);
  }

  /// It returns the count of items present in the [_selectedItem] cart list
  int getItemCount() {
    return _selectedItem.length;
  }
}
