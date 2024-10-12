import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/utils/app_colors.dart';

class AppAssets {
  AppAssets._();

  static const String slpashgif = "assets/splash.gif";
  static const String appname = "assets/appname.png";
  static const String welcome = "assets/splash.png";
  static const String password = "assets/password.png";
  static const String datepicker = "assets/date.png";
  static const String congratulation = "assets/congratulation.png";
  static const String date = "assets/date.png";
  static const String homebackground = "assets/homebackground.png";
  static const String profilecard1 = "assets/profile1.png";
  static const String profilecard2 = "assets/profile2.png";
  static const String myprofile2 = "assets/profie.png";
  static const String profileedit = "assets/profile_edit.png";
  static const String profile2 = "assets/profile2.png";
  static const String tripbackground = "assets\tripbackground.png";
  static const String chatuser = "assets/chat.png";

  static const String apple = "assets/icons/apple.svg";
  static const String google = "assets/icons/google.svg";
  static const String facebook = "assets/icons/facebook.svg";
  static const String email = "assets/icons/email.svg";
  static const String backbutton = "assets/icons/backbutton.svg";
  static const String cancel = "assets/icons/cancel.svg";
  static const String bulletpoint = "assets/icons/bulletpoints.svg";
  static const String takephoto = "assets/icons/takephoto.svg";
  static const String facebookbutton = "assets/icons/facebookbutton.svg";
  static const String instagram = "assets/icons/instagram.svg";
  static const String tripadvisor = "assets/icons/tripadvisor.svg";
  static const String check = "assets/icons/check.svg";
  static const String addlanguage = "assets/icons/addlanguahe.svg";
  static const String message = "assets/icons/messages.svg";
  static const String notification = "assets/icons/notification.svg";
  static const String mappin = "assets/icons/mappin.svg";
  static const String thisorthat = "assets/icons/thisorthat.svg";
  static const String instagramwhite = "assets/icons/instagramwhite.svg";
  static const String birthchart = "assets/icons/birthchart.svg";
  static const String stamps = "assets/icons/stamps.svg";
  static const String setting = "assets/icons/setting.svg";
  static const String myprofile = "assets/icons/myprofile.svg";
  static const String invitefriend = "assets/icons/invitefriend.svg";
  static const String logout = "assets/icons/logout.svg";
  static const String drawercancel = "assets/icons/drawercancel.svg";
  static const String appicon = "assets/icons/appicon.svg";
  static const String homeicon = "assets/icons/homeicon.svg";
  static const String portugal = "assets/icons/Portugal.svg";
  static const String france = "assets/icons/France.svg";
  static const String germany = "assets/icons/Germany.svg";
  static const String savedplace = "assets/icons/saveplace.svg";
  static const String down = "assets/icons/down.svg";
  static const String circleinfo = "assets/icons/circle-info.svg";
  static const String applepay = "assets/icons/applepay.svg";
  static const String gpay = "assets/icons/gpay.svg";
  static const String paypal = "assets/icons/paypal.svg";
  static const String transfer = "assets/icons/transfer.svg";
  static const String more = "assets/icons/more.svg";
  static const String splits = "assets/icons/split.svg";
  static const String phone = "assets/icons/phone.svg";
  static const String videocall = "assets/icons/video.svg";

  // Tabs//
  static const String home = "assets/icons/home.svg";
  static const String trips = "assets/icons/trip.svg";
  static const String wallet = "assets/icons/wallet.svg";
  static const String chats = "assets/icons/chat.svg";
  static const String profile = "assets/icons/profile.svg";
  static const String homefill = "assets/icons/homefill.svg";
  static const String tripsfill = "assets/icons/tripsfill.svg";
  static const String walletfill = "assets/icons/walletfill.svg";
  static const String chatsfill = "assets/icons/chatfill.svg";
  static const String profilefill = "assets/icons/profilefill.svg";
}

class SvgIcon extends StatelessWidget {
  const SvgIcon(this.iconPath, {super.key, double size = 14, this.color})
      : width = size,
        height = size;
  final String iconPath;
  final double width;
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    const Color srcColor = AppColors.blackColor;
    return SvgPicture.asset(iconPath,
        width: width,
        height: height,
        colorFilter: ColorFilter.mode(color ?? srcColor, BlendMode.srcIn));
  }
}
