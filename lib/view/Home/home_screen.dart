import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/tabs/tabs.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/routes/route.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/darwer_tile.dart';
import 'package:travel_app/widgets/profie_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: AppColors.backgroungcolor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Topbar(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40.r, vertical: 40.h),
              width: double.infinity,
              height: 150.h,
              color: AppColors.textcolor.withOpacity(0.1),
              child: Text.rich(
                TextSpan(
                  text: "Your next trip to",
                  style: textStyle16.copyWith(
                      fontSize: 24.sp,
                      color: AppColors.textcolor,
                      fontWeight: FontWeight.w600),
                  children: [
                    TextSpan(
                      text: "\nLisbon is in 24 days.",
                      style: textStyle16.copyWith(
                          fontSize: 24.sp,
                          color: AppColors.darkredcolor,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                40.h.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.r),
                  child: GlobalText(
                    "Explore Trabellas around you",
                    textStyle: textStyle16SemiBold.copyWith(
                      color: AppColors.darkredcolor,
                      fontSize: 24.sp,
                    ),
                  ),
                ),
                10.h.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.r),
                  child: GlobalText(
                    "Travelling to your destination the same time",
                    textStyle: textStyle16SemiBold.copyWith(
                      color: AppColors.textcolor,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
                20.h.verticalSpace,
                Padding(
                  padding: EdgeInsets.only(left: 40.r),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const ProfieCard(
                          image: AppAssets.profilecard1,
                          name: "Maya 41",
                          country: "Italy",
                        ),
                        25.w.horizontalSpace,
                        const ProfieCard(
                          image: AppAssets.profilecard2,
                          name: "Mayu, 43",
                          country: "Japan",
                        ),
                        25.w.horizontalSpace,
                        const ProfieCard(
                          image: AppAssets.profilecard1,
                          name: "Sthopia",
                          country: "France",
                        ),
                      ],
                    ),
                  ),
                ),
                20.h.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.r),
                  child: GlobalText(
                    "Near your current location",
                    textStyle: textStyle18.copyWith(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                20.h.verticalSpace,
                Padding(
                  padding: EdgeInsets.only(left: 40.r),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const ProfieCard(
                          image: AppAssets.profilecard1,
                          name: "Maya",
                          country: "Italy",
                        ),
                        25.w.horizontalSpace,
                        const ProfieCard(
                          image: AppAssets.profilecard2,
                          name: "Mayu, 43",
                          country: "Japan",
                        ),
                        25.w.horizontalSpace,
                        const ProfieCard(
                          image: AppAssets.profilecard1,
                          name: "Sthopia",
                          country: "France",
                        ),
                      ],
                    ),
                  ),
                ),
                30.h.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.r),
                  child: GlobalText("Complete your profile",
                      textStyle: textStyle16SemiBold.copyWith(
                        color: AppColors.darkredcolor,
                        fontSize: 24.sp,
                      )),
                ),
                10.h.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.r),
                  child: GlobalText(
                    "Who's travelling to your destination the same time",
                    textStyle: textStyle16SemiBold.copyWith(
                      color: AppColors.textcolor.withOpacity(0.8),
                      fontSize: 18.sp,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.r, vertical: 20.h),
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 20.h,
                    crossAxisSpacing: 20.w,
                    childAspectRatio: 0.9,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ProfileOptionButton(
                          AppAssets.thisorthat, "PLAY\nTHIS OR THAT"),
                      ProfileOptionButton(
                          AppAssets.stamps, "ADD\nTRAVEL STAMPS"),
                      ProfileOptionButton(AppAssets.instagramwhite,
                          "LINK YOUR\nSOCIAL PROFILES"),
                      ProfileOptionButton(
                          AppAssets.birthchart, "ENTER YOUR\nBIRTH CHART"),
                    ],
                  ),
                ),
                20.h.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.r),
                  child: GlobalText("Tell us about your friends",
                      textStyle: textStyle16SemiBold.copyWith(
                        color: AppColors.darkredcolor,
                        fontSize: 24.sp,
                      )),
                ),
                10.h.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.r),
                  child: GlobalText(
                    "Endorse your friends so other Trabellas know about them",
                    textStyle: textStyle16SemiBold.copyWith(
                      color: AppColors.textcolor.withOpacity(0.8),
                      fontSize: 18.sp,
                    ),
                  ),
                ),
                20.h.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.r),
                  child:
                      AppButton(onPressed: () {}, text: "ENDORSE YOUR FRIENDS"),
                ),
                30.h.verticalSpace,
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget Topbar() {
    return Stack(
      children: [
        Image.asset(
          AppAssets.homebackground,
          height: 430.h,
          width: 430.w,
        ),
        Padding(
          padding: EdgeInsets.only(
            right: 40.r,
            left: 30.r,
            top: 80.h,
          ),
          child: Row(
            children: [
              Builder(
                builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: SvgPicture.asset(
                      AppAssets.message,
                    ),
                  );
                },
              ),
              const Spacer(),
              SvgPicture.asset(
                AppAssets.notification,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GlobalText(
              "Good morning, Thalia!",
              textStyle: textStyle16SemiBold.copyWith(
                color: AppColors.whiteColor,
                fontSize: 40.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget ProfileOptionButton(String icons, String text) {
    return Container(
      height: 200.h,
      width: 164.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.darkredcolor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icons,
            width: 50.r,
          ),
          30.h.verticalSpace,
          GlobalText(
            text,
            textAlign: TextAlign.center,
            textStyle: textStyle18SemiBold.copyWith(
              color: AppColors.textcolor,
            ),
          ),
        ],
      ),
    );
  }
}
