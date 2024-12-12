import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

final appBarTitleStyle = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.bold,
  fontSize: 17.sp,
);
final textStyle16SemiBold = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w600,
  fontSize: 16.sp,
);
final textStyle16Bold = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.bold,
  fontSize: 16.sp,
);
final textStyle16 = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 18.sp,
);
final textStyle14 = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 18.sp,
);
final textStyle14SemiBold = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 14.sp,
  fontWeight: FontWeight.w600,
);

final textStyle12 = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 12.sp,
);
final textStyle18 = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 18.sp,
);

final textStyle18SemiBold = TextStyle(
    fontFamily: 'Roboto', fontSize: 18.sp, fontWeight: FontWeight.w600);

final textStyle20SemiBold = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 30.sp,
  fontWeight: FontWeight.w600,
);

final textstyle30semiBold = TextStyle(
  fontFamily: 'Roboto',
  fontSize: 30.sp,
  fontWeight: FontWeight.w600,
);

final primaryTextButtonTheme = TextButton.styleFrom(
  backgroundColor: AppColors.blackColor,
  foregroundColor: Colors.white,
  // fixedSize: Size(ScreenUtil().screenWidth, 48.h),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
  textStyle: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  ),
);
final primaryElevatedButtonTheme = ElevatedButton.styleFrom(
  // elevation: 0,
  backgroundColor: AppColors.blackColor,
  foregroundColor: Colors.white,
  fixedSize: Size(ScreenUtil().screenWidth, 48.h),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
  textStyle: TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  ),
);
