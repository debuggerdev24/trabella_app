import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';

class KBackButton extends StatelessWidget {
  const KBackButton({
    super.key,
    this.onBackClick,
    this.size,
    required this.color,
    required this.iconcolor,
  });

  final VoidCallback? onBackClick;
  final Color color;
  final Color iconcolor;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onBackClick != null) {
          onBackClick!();
        } else {
          context.pop();
        }
      },
      child: Container(
        width: 40.w,
        height: 40.h,
        padding: EdgeInsets.only(top: 8.sp, bottom: 8.sp, right: 3.sp),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: SvgIcon(
          AppAssets.backbutton,
          color: iconcolor,
          size: size ?? 16.w,
        ),
      ),
    );
  }
}
