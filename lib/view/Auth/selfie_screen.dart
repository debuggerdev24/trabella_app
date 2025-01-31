import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/routes/route.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/view/Auth/idverification.dart';
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
                150.h.verticalSpace,
                const KBackButton(
                  color: AppColors.darkredcolor,
                  iconcolor: AppColors.backgroungcolor,
                ),
                70.h.verticalSpace,
                GlobalText(
                  'It’s time for a selfie.Smile!',
                  textStyle: textStyle20SemiBold.copyWith(
                    color: AppColors.redcolor,
                  ),
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
            contentPadding: EdgeInsets.symmetric(horizontal: 10.h),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 12.r),
                      child: GestureDetector(
                          onTap: () {
                            context.pop();
                            context.pushNamed(AppRoute.takeselfiescreen.name);
                          },
                          child: SvgPicture.asset(AppAssets.cancel)),
                    ),
                  ],
                ),
                const TitleField(text: 'Tips'),
                10.h.verticalSpace,
                BulletList(
                  strings: [
                    'Make sure we can see you clearly',
                    'Keep your face free of anything that hides it (glasses are fine,but no sunnies)',
                    'Look straight at the camera',
                    'Take a live picture - old photos won’t work'
                  ],
                  fontSize: 16.sp,
                ),
                22.h.verticalSpace,
              ],
            ),
          );
        });
  }
}
