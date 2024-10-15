import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/routes/route.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/waitinglist.dart';

class CongratulationsScreen extends StatefulWidget {
  const CongratulationsScreen({super.key});

  @override
  State<CongratulationsScreen> createState() => _CongratulationsScreenState();
}

class _CongratulationsScreenState extends State<CongratulationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroungcolor,
      body: Stack(
        children: [
          Image.asset(
            AppAssets.congratulation,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                ),
                child: SvgIcon(
                  AppAssets.check,
                  size: 182.sp,
                  color: AppColors.backgroungcolor,
                ),
              ),
              50.h.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                ),
                child: GlobalText(
                  'Congratulations!',
                  textStyle: textStyle20SemiBold.copyWith(
                    color: AppColors.backgroungcolor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                ),
                child: GlobalText(
                  'You’vee signed up successfully. Time to explore the Trabella’s world!',
                  textStyle: textStyle18.copyWith(
                    color: AppColors.backgroungcolor,
                    fontSize: 18.sp,
                  ),
                ),
              ),
              60.h.verticalSpace,
              bottomBar(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget bottomBar(BuildContext context) {
    return Container(
      height: 300.h,
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      decoration: const BoxDecoration(
        color: AppColors.darkredcolor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GlobalText("Let’s set up your profile!",
              textStyle: textStyle18SemiBold.copyWith(
                  color: AppColors.backgroungcolor, fontSize: 24.sp)),
          AppButton(
              colorType: AppButtonColorType.secondary,
              onPressed: () {
                context.pushNamed(AppRoute.setcityscreen.name);
              },
              text: "SURE!",
              textStyle: const TextStyle(color: AppColors.backgroungcolor)),
          GestureDetector(
            onTap: () {
              context.pushNamed(AppRoute.setcityscreen.name);
            },
            child: GlobalText(
              color: AppColors.backgroungcolor,
              'Maybe Later!',
              textStyle: textStyle18SemiBold.copyWith(
                  decorationColor: AppColors.backgroungcolor,
                  decoration: TextDecoration.underline,
                  color: AppColors.backgroungcolor),
            ),
          ),
        ],
      ),
    );
  }
}
