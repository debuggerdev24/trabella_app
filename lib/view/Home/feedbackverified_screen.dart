import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/routes/route.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/widgets/back_button.dart';

class FeedbackverifiedScreen extends StatelessWidget {
  const FeedbackverifiedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkredcolor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            100.h.verticalSpace,
            KBackButton(
                color: AppColors.backgroungcolor,
                iconcolor: AppColors.darkredcolor),
            Spacer(),
            Center(
              child: GlobalText(
                "Thank you for your feedback!",
                textStyle: textStyle16Bold.copyWith(
                    color: AppColors.backgroungcolor, fontSize: 40.sp),
              ),
            ),
            Center(
              child: GlobalText(
                "We truly appreciate the time you took to share your thoughts and the insights you've provided!",
                textStyle: textStyle18.copyWith(
                  color: AppColors.backgroungcolor,
                ),
              ),
            ),
            80.h.verticalSpace,
            GestureDetector(
                onTap: () {
                  context.goNamed(AppRoute.homescreen.name);
                },
                child: SvgPicture.asset(AppAssets.homeicon)),
            Spacer()
          ],
        ),
      ),
    );
  }
}
