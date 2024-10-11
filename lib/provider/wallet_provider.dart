import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/utils/enum/payment_methos_enum.dart';
import 'package:travel_app/utils/enum/trip_tab_enum.dart';
import 'package:travel_app/utils/enum/wallet_paymet_enum.dart';
import 'package:travel_app/widgets/paymet_optiontile.dart';

class WalletProvider with ChangeNotifier {
  String _splitlist = 'Search';
  PaymentMethosEnum _selectedMethod = PaymentMethosEnum.paypal;
  WalletPaymetEnum _paymnetoption = WalletPaymetEnum.transfer;

  String? get splitlist => _splitlist;

  PaymentMethosEnum get selectedMethod => _selectedMethod;

  WalletPaymetEnum get PaymentOption => _paymnetoption;

  void changeSelectedMethod(PaymentMethosEnum value) {
    _selectedMethod = value;
    notifyListeners();
  }

  void changepaymentoption(WalletPaymetEnum value) {
    _paymnetoption = value;
    notifyListeners();
  }

  void changesplitbill(String? newValue) {
    _splitlist = newValue ?? "";
    notifyListeners();
  }
}
