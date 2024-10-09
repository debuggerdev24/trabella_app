import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/routes/route.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/view/Auth/verifiaction_screen.dart';
import 'package:travel_app/widgets/app_button.dart';

class Waitinglist extends StatelessWidget {
  const Waitinglist({
    super.key,
    required this.title,
    required this.subtitle,
    required this.text,
    this.onpressed,
  });

  final String title;
  final String subtitle;
  final String text;
  final void Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      decoration: const BoxDecoration(
        color: AppColors.darkredcolor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GlobalText(title,
              textStyle: textStyle18SemiBold.copyWith(
                  color: AppColors.backgroungcolor, fontSize: 25.sp)),
          20.h.verticalSpace,
          GlobalText(subtitle,
              textAlign: TextAlign.center,
              textStyle: textStyle16.copyWith(
                color: AppColors.backgroungcolor,
              )),
          40.h.verticalSpace,
          AppButton(
              colorType: AppButtonColorType.secondary,
              onPressed: onpressed,
              text: text,
              textStyle: const TextStyle(color: AppColors.darkredcolor))
        ],
      ),
    );
  }
}
