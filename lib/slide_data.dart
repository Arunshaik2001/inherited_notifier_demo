

import 'package:flutter/material.dart';

class SlideData extends ChangeNotifier{
  double _value = 0;
  double get value => _value;
  set value(double newValue){
    if(_value != newValue){
      _value = newValue;
      notifyListeners();
    }
  }
}