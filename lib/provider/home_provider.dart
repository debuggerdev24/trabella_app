// stepper_provider.dart
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  String _selectedcountry = 'Australia';

  String? get selectedcountry => _selectedcountry;

  void changeSelectedCountry(String? newValue) {
    _selectedcountry = newValue ?? "Australia";
    notifyListeners();
  }
}
