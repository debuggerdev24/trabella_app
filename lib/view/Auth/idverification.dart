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
import 'package:travel_app/view/auth/take_photo_screen.dart';
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
                150.h.verticalSpace,
                const KBackButton(
                  color: AppColors.darkredcolor,
                  iconcolor: AppColors.backgroungcolor,
                ),
                70.h.verticalSpace,
                GlobalText(
                  'Help us secure the Trabella community by verifying your ID',
                  textStyle: textstyle30semiBold.copyWith(
                    color: AppColors.redcolor,
                  ),
                ),
                15.h.verticalSpace,
                GlobalText(
                  'Please take a photo of your ID so we can verify it’s you',
                  textStyle: textStyle16.copyWith(
                    color: AppColors.textcolor,
                  ),
                ),
                60.h.verticalSpace,
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
                      padding: EdgeInsets.only(top: 12.sp),
                      child: GestureDetector(
                          onTap: () {
                            context.pushNamed(AppRoute.takephotoscreen.name);
                          },
                          child: SvgPicture.asset(AppAssets.cancel)),
                    ),
                  ],
                ),
                19.h.verticalSpace,
                const TitleField(text: 'ID we accept are:'),
                2.h.verticalSpace,
                BulletList(
                  strings: [
                    'Passport',
                    'Driver’s Licence',
                    'EU Nationality Card'
                  ],
                  fontSize: 18.sp,
                ),
                32.h.verticalSpace,
                const TitleField(text: 'Tips'),
                2.h.verticalSpace,
                BulletList(
                  strings: [
                    'Make sure you’re in a well-lit room',
                    'Check there’s no glare on your ID',
                    'Put your ID on a plain, dark surface',
                    'Check we can see all the details of\n your ID clearly'
                  ],
                  fontSize: 15.sp,
                ),
                35.h.verticalSpace,
              ],
            ),
          );
        });
  }
}

class TitleField extends StatelessWidget {
  final String text;
  const TitleField({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: GlobalText(
        text,
        textStyle: textStyle20SemiBold.copyWith(
          color: AppColors.darkredcolor,
          fontSize: 19.5.sp,
        ),
      ),
    );
  }
}

class BulletList extends StatelessWidget {
  final List<String> strings;
  final double fontSize;

  const BulletList({super.key, required this.strings, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(18.sp, 4.sp, 14.sp, 15.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: strings.map((str) {
          return Padding(
            padding: EdgeInsets.only(bottom: 5.sp),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 6.h),
                  height: 10.h,
                  width: 10.h,
                  child: SvgPicture.asset(AppAssets.bulletpoint),
                  decoration: BoxDecoration(
                      //shape: BoxShape.circle,
                      ),
                ),
                10.w.horizontalSpace,
                Expanded(
                  child: Text(
                    str,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: fontSize,
                      color: AppColors.textcolor.withOpacity(0.9),
                      height: 1.55,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
