import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/routes/route.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/view/Auth/verifiaction_screen.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/back_button.dart';

class IDverificationScreen extends StatefulWidget {
  const IDverificationScreen({super.key});

  @override
  State<IDverificationScreen> createState() => _IDverificationScreenState();
}

class _IDverificationScreenState extends State<IDverificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroungcolor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 40.r,
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
                  'Help us secure the Trabella community by verifying your ID',
                  textStyle: textStyle20SemiBold.copyWith(
                      color: AppColors.redcolor,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600),
                ),
                10.h.verticalSpace,
                GlobalText(
                  'Please take a photo of your ID so we can verify it’s you',
                  textStyle: textStyle16.copyWith(
                      color: AppColors.textcolor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600),
                ),
                50.h.verticalSpace,
                AppButton(
                  onPressed: () {
                    openAlertBox();
                  },
                  text: "TAKE A PHOTO OF YOUR ID",
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
                            context.pushNamed(AppRoute.takephotoscreen.name);
                          },
                          child: SvgPicture.asset(AppAssets.cancel)),
                    ),
                  ],
                ),
                19.h.verticalSpace,
                GlobalText(
                  "ID we accept are:",
                  textStyle: textStyle20SemiBold.copyWith(
                      color: AppColors.darkredcolor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600),
                ),
                10.h.verticalSpace,
                reqiredfiled("Password"),
                8.h.verticalSpace,
                reqiredfiled("Driver’s Licence"),
                8.h.verticalSpace,
                reqiredfiled("EU Nationality Card"),
                32.h.verticalSpace,
                GlobalText(
                  "Tips:",
                  textStyle: textStyle20SemiBold.copyWith(
                      color: AppColors.darkredcolor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600),
                ),
                10.h.verticalSpace,
                reqiredfiled("Make sure you’re in a well-lit room"),
                8.h.verticalSpace,
                reqiredfiled("Check there’s no glare on your ID"),
                8.h.verticalSpace,
                reqiredfiled("Put your ID on a plain, dark surface"),
                8.h.verticalSpace,
                reqiredfiled(
                    "Check we can see all the details of\n your ID clearly"),
                32.h.verticalSpace
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
