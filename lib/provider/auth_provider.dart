// stepper_provider.dart
import 'package:flutter/material.dart';

class Authprovider with ChangeNotifier {
  int _currentStep = 0;
  DateTime _selectedDate = DateTime.now();

  String? password;
  String? _confirmPassword;
  String? _name;
  String? lastName;
  String? nickname;

  int get currentStep => _currentStep;
  DateTime get selectedDate => _selectedDate;
  String get name => _name ?? ""; 
  String get confirmPassword => _confirmPassword ?? ""; 
 


  

  

  void nextStep() {
    if (_currentStep < 5) {
      _currentStep++;
      notifyListeners();
    }
  }

  void previousStep() {
    if (_currentStep > 0) {
      _currentStep--;
      notifyListeners();
    }
  }

  void jumpToStep(int step) {
    _currentStep = step;
    notifyListeners();
  }

  void updateDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void updatePassword(String? pwd) {
    password = pwd;
    notifyListeners();
  }

   updateConfirmPassword(String pwd) {
    _confirmPassword = pwd;
    notifyListeners();
  }

  void updateFirstName(String name) {
    _name = name;
    notifyListeners();
  }

  void updateLastName(String name) {
    lastName = name;
    notifyListeners();
  }

  void updateNickname(String name) {
    nickname = name;
    notifyListeners();
  }
}
