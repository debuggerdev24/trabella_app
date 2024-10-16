import 'package:flutter/material.dart';
import 'package:travel_app/utils/enum/edit_profie_tab_enum.dart';

class ProfileProvider with ChangeNotifier {
  int _currentindex = 0;
  EditProfileEnum _currentEditTab = EditProfileEnum.edit;

  int? get currentindex => _currentindex;
  EditProfileEnum get currentEditTab => _currentEditTab;

  void changeProfileTab(EditProfileEnum value) {
    _currentEditTab = value;
    notifyListeners();
  }

  void changeslidervalue(int index) {
    _currentindex = index;
    notifyListeners();
  }
}
