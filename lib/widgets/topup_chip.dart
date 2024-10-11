import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/styles.dart';

class TopUpChip extends StatelessWidget {
  const TopUpChip({
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
    return InkWell(
      onTap: onTap,
      child: IntrinsicWidth(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10),
          // alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? AppColors.darkredcolor : AppColors.textcolor,
            ),
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              child: Text(
                maxLines: 10,
                text,
                style: textStyle16SemiBold.copyWith(
                  color:
                      isSelected ? AppColors.darkredcolor : AppColors.greycolor,
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
