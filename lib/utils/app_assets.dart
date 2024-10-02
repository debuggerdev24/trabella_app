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
