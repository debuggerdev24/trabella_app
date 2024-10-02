import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/routes/route.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/back_button.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroungcolor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                100.h.verticalSpace,
                const KBackButton(
                  color: AppColors.darkredcolor,
                  iconcolor: AppColors.backgroungcolor,
                ),
                60.h.verticalSpace,
                GlobalText(
                  'We’ll let you know when you have  Trabellas near you.',
                  textStyle: textStyle20SemiBold.copyWith(
                      color: AppColors.redcolor,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600),
                ),
                100.h.verticalSpace,
                AppButton(
                  onPressed: () {
                    context.pushNamed(AppRoute.idverificationscreen.name);
                  },
                  text: "ALLOW NOTIFICATION",
                ),
                10.h.verticalSpace,
                GestureDetector(
                  onTap: () {
                    context.pushNamed(AppRoute.idverificationscreen.name);
                  },
                  child: Center(
                    child: GlobalText(
                      color: AppColors.greycolor,
                      'Skip',
                      textStyle: textStyle18SemiBold.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.textcolor.withOpacity(0.8),
                        color: AppColors.textcolor.withOpacity(0.8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
