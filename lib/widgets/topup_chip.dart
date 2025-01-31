import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/enum/top_up_enum.dart';
import 'package:travel_app/utils/styles.dart';

class TopUpChip extends StatelessWidget {
  const TopUpChip(
      {required this.value, required this.currentValue, required this.ontap});

  final TopUpEnum value;
  final TopUpEnum currentValue;
  final Function(TopUpEnum) ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value == currentValue) return;
        ontap(value);
      },
      borderRadius: BorderRadius.circular(30.r),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 45.h,
        width: 135.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(
              color: value == currentValue
                  ? AppColors.darkredcolor
                  : AppColors.textcolor,
            ),
            borderRadius: BorderRadius.circular(30.r)),
        child: Text(value.getTitle(),
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: value == currentValue
                    ? AppColors.darkredcolor
                    : AppColors.textcolor)),
      ),
    );
  }
}
