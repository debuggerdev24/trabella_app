import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/styles.dart';

enum AppButtonWidthType { full, half }

enum AppButtonColorType { primary, secondary, greyed }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.foregroundColor,
    this.type = AppButtonWidthType.full,
    this.colorType = AppButtonColorType.primary,
    this.isLoading = false,
    this.elevation,
    this.radius = 30,
    this.icon,
    this.textStyle,
  });

  final VoidCallback? onPressed;
  final String text;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final AppButtonWidthType? type;
  final AppButtonColorType? colorType;
  final bool? isLoading;
  final double? radius;
  final double? elevation;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: AppColors.backgroungcolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: backgroundColor ??
            (colorType == AppButtonColorType.primary
                ? AppColors.darkredcolor
                : AppColors.backgroungcolor),
        foregroundColor: foregroundColor ??
            (colorType == AppButtonColorType.greyed
                ? AppColors.darkredcolor
                : colorType == AppButtonColorType.primary
                    ? AppColors.backgroungcolor
                    : AppColors.darkredcolor),
        fixedSize: type == AppButtonWidthType.full
            ? Size(350.w, 65.h)
            : Size(350.w, 65.h),
      ),
      label: GlobalText(
        text,
        textStyle: textStyle16.copyWith(fontSize: 16.sp),
      ),
    );
  }
}