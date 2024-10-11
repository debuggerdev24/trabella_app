import 'package:travel_app/utils/app_assets.dart';

enum PaymentMethosEnum { applePay, googlePay, paypal, creditCard }

extension PaymentMethosExtension on PaymentMethosEnum {
  String getTitle() {
    return switch (this) {
      PaymentMethosEnum.applePay => "Apple Pay",
      PaymentMethosEnum.googlePay => "Google Pay",
      PaymentMethosEnum.paypal => "PayPal",
      PaymentMethosEnum.creditCard => "Credit Card",
    };
  }
   String getIcon() {
    return switch (this) {
      PaymentMethosEnum.applePay => AppAssets.applepay,
      PaymentMethosEnum.googlePay => AppAssets.gpay,
      PaymentMethosEnum.paypal => AppAssets.paypal,
      PaymentMethosEnum.creditCard => "",
    };
  }
   
}
