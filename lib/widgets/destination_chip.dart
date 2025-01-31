import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/styles.dart';

class AppChip extends StatelessWidget {
  const AppChip({
    super.key,
    required this.text,
    this.backgroundColor,
    this.isSelected = false,
    this.onTap,
    this.isnotselected = false,
  });

  final String text;
  final Color? backgroundColor;
  final bool isSelected;
  final VoidCallback? onTap;
  final bool isnotselected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: IntrinsicWidth(
        // stepWidth: 150,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.sp),
          padding: EdgeInsets.only(
              left: text.length > 20 ? 0.sp : 30.sp,
              top: 10,
              bottom: 10,
              right: text.length > 20 ? 0.sp : 30.sp),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? AppColors.darkredcolor : AppColors.textcolor,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: GlobalText(
                    maxLine: 10,
                    textAlign: TextAlign.center,
                    text,
                    textStyle: textStyle16.copyWith(
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? AppColors.darkredcolor
                          : AppColors.greycolor,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
