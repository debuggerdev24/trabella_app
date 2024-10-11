import 'package:travel_app/utils/app_assets.dart';

enum WalletPaymetEnum { topup, split, transfer, more }

extension WalletPaymetEnumExtension on WalletPaymetEnum {
  String getTitle() {
    return switch (this) {
      WalletPaymetEnum.topup => "TOP UP",
      WalletPaymetEnum.split => "SPLIT",
      WalletPaymetEnum.transfer => "TRANFER",
      WalletPaymetEnum.more => "MORE",
    };
  }

  String getIcon() {
    return switch (this) {
      WalletPaymetEnum.topup => AppAssets.addlanguage,
      WalletPaymetEnum.split => AppAssets.splits,
      WalletPaymetEnum.transfer => AppAssets.transfer,
      WalletPaymetEnum.more => AppAssets.more,
    };
  }
}
