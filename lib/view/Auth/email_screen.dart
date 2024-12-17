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
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 0 && !_isScrolled) {
        setState(() {
          _isScrolled = true;
        });
      } else if (_scrollController.offset <= 0 && _isScrolled) {
        setState(() {
          _isScrolled = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroungcolor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            150.h.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40.w,
              ),
              child: const KBackButton(
                color: AppColors.darkredcolor,
                iconcolor: AppColors.backgroungcolor,
              ),
            ),
            70.h.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40.w,
              ),
              child: GlobalText(
                'Let’s start with your email',
                textStyle: textstyle30semiBold.copyWith(
                    fontSize: 29.99.sp,
                    color: AppColors.redcolor,
                    fontWeight: FontWeight.w600),
              ),
            ),
            150.h.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40.w,
              ),
              child: AppTextField(
                fillcolor: Colors.transparent,
                hintText: "trabella@travel.com",
              ),
            ),
            30.h.verticalSpace,
            Padding(
              padding: EdgeInsets.only(
                left: _isScrolled ? 0 : 40.w,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: _scrollController,
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
            ),
            60.h.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 40.w,
              ),
              child: AppButton(
                  onPressed: () {
                    context.pushNamed(AppRoute.otpscreen.name);
                  },
                  text: "CHECK YOUR EMAIL"),
            ),
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
            color: AppColors.textcolor.withOpacity(0.8), fontSize: 16.sp),
      )),
    );
  }
}
