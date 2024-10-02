import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/routes/route.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/back_button.dart';

class selfieScreen extends StatefulWidget {
  const selfieScreen({super.key});

  @override
  State<selfieScreen> createState() => _selfieScreenState();
}

class _selfieScreenState extends State<selfieScreen> {
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
                  'It’s time for a selfie. Smile!',
                  textStyle: textStyle20SemiBold.copyWith(
                      color: AppColors.redcolor,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600),
                ),
                5.h.verticalSpace,
                GlobalText(
                  'This will let us know it’s really you.',
                  textStyle: textStyle16.copyWith(
                    color: AppColors.blackColor.withOpacity(0.9),
                  ),
                ),
                100.h.verticalSpace,
                AppButton(
                  onPressed: () {
                    openAlertBox();
                    context.pushNamed(AppRoute.takeselfiescreen.name);
                    
                  },
                  text: "TAKE A SELFIE",
                ),
                10.h.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }

  openAlertBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: AppColors.backgroungcolor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.r))),
            contentPadding: EdgeInsets.symmetric(horizontal: 30.h),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 13.r),
                      child: GestureDetector(
                          onTap: () {
                            context.pop();
                          },
                          child: SvgPicture.asset(AppAssets.cancel)),
                    ),
                  ],
                ),
                10.h.verticalSpace,
                reqiredfiled("Make sure we can see you clearly"),
                8.h.verticalSpace,
                reqiredfiled(
                    "Keep your face free of anything that hides it (glasses are fine, but no sunnies)"),
                8.h.verticalSpace,
                reqiredfiled("Look straight at the camera"),
                8.h.verticalSpace,
                reqiredfiled("Take a live picture - old photos won’t work"),
                32.h.verticalSpace,
              ],
            ),
          );
        });
  }

  Widget reqiredfiled(String text) {
    return Row(
      children: [
        SvgPicture.asset(AppAssets.bulletpoint),
        10.w.horizontalSpace,
        GlobalText(text,
            textStyle: textStyle14.copyWith(
                color: AppColors.textcolor.withOpacity(0.9))),
      ],
    );
  }
}
