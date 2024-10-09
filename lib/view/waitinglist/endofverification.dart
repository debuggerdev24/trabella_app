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

class EndofverificationScreen extends StatefulWidget {
  const EndofverificationScreen({super.key});

  @override
  State<EndofverificationScreen> createState() =>
      _EndofverificationScreenState();
}

class _EndofverificationScreenState extends State<EndofverificationScreen> {
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
                'Thank you!',
                textStyle: textStyle20SemiBold.copyWith(
                    color: AppColors.backgroungcolor,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w600),
              ),
              GlobalText(
                'A referral code is coming your way on your 40th birthday!',
                textStyle: textStyle20SemiBold.copyWith(
                    color: AppColors.backgroungcolor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w300),
              ),
              125.h.verticalSpace,
              GlobalText(
                'In the meantime, check out and follow our social accounts!',
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

  startTimer() async {
    var duration = const Duration(milliseconds: 2000);
    if (!mounted) return;
    return Future.delayed(
      duration,
      () {
        context.pushNamed(AppRoute.homescreen.name);
      },
    );
  }
}
