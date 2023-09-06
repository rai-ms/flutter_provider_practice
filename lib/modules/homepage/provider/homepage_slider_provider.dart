import 'package:flutter/cupertino.dart';

class HomePageSliderProvider extends ChangeNotifier
{
  double _value = 1.0;
  double get value => _value;
  void setValue(double value)
  {
    _value = value;
    notifyListeners();
  }
}