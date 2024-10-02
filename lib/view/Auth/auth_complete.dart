import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/utils/routes/route.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/widgets/back_button.dart';

class AuthCompletedScreen extends StatefulWidget {
  const AuthCompletedScreen({super.key});

  @override
  State<AuthCompletedScreen> createState() => _AuthCompletedScreenState();
}

class _AuthCompletedScreenState extends State<AuthCompletedScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkredcolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              100.h.verticalSpace,
              const KBackButton(
                color: AppColors.backgroungcolor,
                iconcolor: AppColors.darkredcolor,
              ),
              178.h.verticalSpace,
              GlobalText(
                'Hold tight, we’re checking the details.',
                textStyle: textStyle20SemiBold.copyWith(
                    color: AppColors.backgroungcolor,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w600),
              ),
              GlobalText(
                'We should be finished within an hour, but sometimes it can take a little longer.',
                textStyle: textStyle20SemiBold.copyWith(
                    color: AppColors.backgroungcolor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w300),
              ),
              125.h.verticalSpace,
              GlobalText(
                'In the meantime, check out and follow our social accounts!',
                textStyle: textStyle20SemiBold.copyWith(
                    color: AppColors.backgroungcolor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600),
              ),
              39.h.verticalSpace,
              Row(
                children: [
                  SvgIcon(
                    AppAssets.facebookbutton,
                    color: AppColors.backgroungcolor,
                    size: 68.w,
                  ),
                  10.w.horizontalSpace,
                  SvgIcon(
                    AppAssets.instagram,
                    color: AppColors.backgroungcolor,
                    size: 68.w,
                  ),
                  10.w.horizontalSpace,
                  SvgIcon(
                    AppAssets.tripadvisor,
                    color: AppColors.backgroungcolor,
                    size: 70.w,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  startTimer() {
    var duration = const Duration(milliseconds: 2000);
    return Future.delayed(
      duration,
      () {
        context.goNamed(AppRoute.authcompletescreen.name);
      },
    );
  }
}