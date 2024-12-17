import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/tabs/tabs.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/routes/route.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/app_txt_field.dart';
import 'package:travel_app/widgets/back_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroungcolor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            120.h.verticalSpace,
            KBackButton(
                color: AppColors.darkredcolor,
                iconcolor: AppColors.backgroungcolor),
            60.h.verticalSpace,
            GlobalText(
              'Welcome back!',
              textStyle: textStyle20SemiBold.copyWith(
                color: AppColors.darkredcolor,
              ),
            ),
            154.h.verticalSpace,
            AppTextField(
              fillcolor: AppColors.backgroungcolor,
              labelText: "Email",
              hintText: "trabella@travel.com",
            ),
            14.h.verticalSpace,
            AppTextField(
              fillcolor: AppColors.backgroungcolor,
              labelText: "Password",
              hintText: "**********",
            ),
            2.h.verticalSpace,
            Align(
              alignment: Alignment.bottomRight,
              child: GlobalText(
                color: AppColors.greycolor,
                'Forgot password?',
                textStyle: textStyle18SemiBold.copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.textcolor.withOpacity(0.8),
                  color: AppColors.textcolor.withOpacity(0.8),
                ),
              ),
            ),
            60.h.verticalSpace,
            AppButton(
                onPressed: () {
                  context.goNamed(AppRoute.homescreen.name);
                },
                text: "LOG IN"),
            Center(
              child: Column(
                children: [
                  50.h.verticalSpace,
                  GlobalText('or log in with',
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
            )
          ],
        ),
      ),
    );
  }
}
