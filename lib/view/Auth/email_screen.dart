import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/utils/routes/route.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/app_txt_field.dart';
import 'package:travel_app/widgets/back_button.dart';

class Emailscreen extends StatefulWidget {
  const Emailscreen({super.key});

  @override
  State<Emailscreen> createState() => _EmailscreenState();
}

class _EmailscreenState extends State<Emailscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroungcolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              120.h.verticalSpace,
              const KBackButton(
                color: AppColors.darkredcolor,
                iconcolor: AppColors.backgroungcolor,
              ),
              50.h.verticalSpace,
              GlobalText(
                'Let’s start with your email',
                textStyle: textStyle20SemiBold.copyWith(
                    color: AppColors.redcolor,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w600),
              ),
              100.h.verticalSpace,
              const AppTextField(
                fillcolor: Colors.transparent,
                hintText: "trabella@travel.com",
              ),
              30.h.verticalSpace,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    suggestionButton('@GMAIL.COM'),
                    10.w.horizontalSpace,
                    suggestionButton('@YAHOO.COM'),
                    10.w.horizontalSpace,
                    suggestionButton('@OUTLINE.COM'),
                  ],
                ),
              ),
              60.h.verticalSpace,
              AppButton(
                  onPressed: () {
                    context.pushNamed(AppRoute.otpscreen.name);
                  },
                  text: "CHECK YOUR EMAIL"),
              50.h.verticalSpace,
              Center(
                child: Column(
                  children: [
                    50.h.verticalSpace,
                    GlobalText('or sign up with',
                        textStyle: textStyle14.copyWith(
                            color: AppColors.textcolor.withOpacity(0.9))),
                    20.h.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(AppAssets.apple),
                        10.w.horizontalSpace,
                        SvgPicture.asset(AppAssets.google),
                        10.w.horizontalSpace,
                        SvgPicture.asset(AppAssets.facebook),
                      ],
                    ),
                  ],
                ),
              ),
              50.h.verticalSpace
            ],
          ),
        ),
      ),
    );
  }

  Widget suggestionButton(String text) {
    return Container(
      width: 144.w,
      height: 40.h,
      decoration: BoxDecoration(
          color: AppColors.backgroungcolor,
          border: Border.all(color: AppColors.greycolor),
          borderRadius: BorderRadius.circular(30.r)),
      child: Center(
          child: GlobalText(
        text,
        textStyle: textStyle16Bold.copyWith(
            color: AppColors.textcolor.withOpacity(0.8), fontSize: 14.sp),
      )),
    );
  }
}
