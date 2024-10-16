import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/styles.dart';

class MyBasic extends StatelessWidget {
  const MyBasic(
      {super.key,
      required this.text,
      this.backgroundColor,
      this.icons,
      this.textstyle});

  final String text;
  final Color? backgroundColor;
  final String? icons;
  final TextStyle? textstyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: IntrinsicWidth(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 13.h),
          // alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgIcon(
                  icons ?? "",
                  size: 26.w,
                ),
                8.w.horizontalSpace,
                Expanded(
                  child: GlobalText(
                    text,
                    textStyle: textstyle ??
                        textStyle16.copyWith(color: AppColors.textcolor,fontSize: 16.sp),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
