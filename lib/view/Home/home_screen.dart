import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart';
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
      drawer: const CustomDrawer(),
      backgroundColor: AppColors.backgroungcolor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Topbar(),
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 40.r, vertical: 40.h),
            //   width: double.infinity,
            //   height: 150.h,
            //   color: AppColors.background,
            //   child: Text.rich(
            //     TextSpan(
            //       text: "No upcoming trips yet.",
            //       style: textStyle16.copyWith(
            //           fontSize: 24.sp,
            //           color: AppColors.textcolor,
            //           fontWeight: FontWeight.w600),
            //       children: [
            //         // TextSpan(
            //         //   text: "\nLisbon is in 24 days.",
            //         //   style: textStyle16.copyWith(
            //         //       fontSize: 24.sp,
            //         //       color: AppColors.darkredcolor,
            //         //       fontWeight: FontWeight.w600),
            //         // ),
            //       ],
            //     ),
            //   ),
            // ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 39.w, vertical: 30.h),
              width: double.infinity,
              height: 131.h,
              color: AppColors.background,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.h.verticalSpace,
                  GlobalText(
                    "No upcoming trips yet.",
                    textStyle: textStyle16.copyWith(
                        fontSize: 24.sp,
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w600),
                  ),
                  12.h.verticalSpace,
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                38.h.verticalSpace,
                Center(
                    child: AppButton(
                        onPressed: () {}, text: "PLAN YOUR NEXT TRIP")),
                // 40.h.verticalSpace,
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 40.r),
                //   child: GlobalText(
                //     "Explore Trabellas around you",
                //     textStyle: textStyle16SemiBold.copyWith(
                //       color: AppColors.darkredcolor,
                //       fontSize: 24.sp,
                //     ),
                //   ),
                // ),
                // 10.h.verticalSpace,
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 40.r),
                //   child: GlobalText(
                //     "Travelling to your destination the same time",
                //     textStyle: textStyle16SemiBold.copyWith(
                //       color: AppColors.textcolor,
                //       fontSize: 18.sp,
                //     ),
                //   ),
                // ),
                // 20.h.verticalSpace,
                // Padding(
                //   padding: EdgeInsets.only(left: 40.r),
                //   child: SingleChildScrollView(
                //     scrollDirection: Axis.horizontal,
                //     child: Row(
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //         const ProfieCard(
                //           image: AppAssets.profilecard1,
                //           name: "Maya 41",
                //           country: "Italy",
                //         ),
                //         25.w.horizontalSpace,
                //         const ProfieCard(
                //           image: AppAssets.profilecard2,
                //           name: "Mayu, 43",
                //           country: "Japan",
                //         ),
                //         25.w.horizontalSpace,
                //         const ProfieCard(
                //           image: AppAssets.profilecard1,
                //           name: "Sthopia",
                //           country: "France",
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // 20.h.verticalSpace,
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 40.r),
                //   child: GlobalText(
                //     "Near your current location",
                //     textStyle: textStyle18.copyWith(
                //         color: AppColors.textcolor,
                //         fontWeight: FontWeight.w600),
                //   ),
                // ),
                // 20.h.verticalSpace,
                // Padding(
                //   padding: EdgeInsets.only(left: 40.r),
                //   child: SingleChildScrollView(
                //     scrollDirection: Axis.horizontal,
                //     child: Row(
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //         const ProfieCard(
                //           image: AppAssets.profilecard1,
                //           name: "Maya",
                //           country: "Italy",
                //         ),
                //         25.w.horizontalSpace,
                //         const ProfieCard(
                //           image: AppAssets.profilecard2,
                //           name: "Mayu, 43",
                //           country: "Japan",
                //         ),
                //         25.w.horizontalSpace,
                //         const ProfieCard(
                //           image: AppAssets.profilecard1,
                //           name: "Sthopia",
                //           country: "France",
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                58.h.verticalSpace,
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
                GestureDetector(
                  onTap: () {
                    context.pushNamed(AppRoute.thisorthatscreen.name);
                  },
                  child: ProfileOptionButton(
                      AppAssets.thisorthat, "PLAY THIS OR THAT"),
                ),
                ProfileOptionButton(AppAssets.stamps, "ADD TRAVEL STAMPS"),
                ProfileOptionButton(
                    AppAssets.instagramwhite, "LINK YOUR\nSOCIAL PROFILES"),
                // Padding(
                //   padding:
                //       EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.h),
                //   child: GridView.count(
                //     shrinkWrap: true,
                //     crossAxisCount: 1,
                //     mainAxisSpacing: 20.h,
                //     crossAxisSpacing: 20.w,
                //     childAspectRatio: 0.9,
                //     physics: NeverScrollableScrollPhysics(),
                //     children: [
                //       GestureDetector(
                //         onTap: () {
                //           context.pushNamed(AppRoute.thisorthatscreen.name);
                //         },
                //         child: ProfileOptionButton(
                //             AppAssets.thisorthat, "PLAY\nTHIS OR THAT"),
                //       ),
                //       ProfileOptionButton(
                //           AppAssets.stamps, "ADD\nTRAVEL STAMPS"),
                //       ProfileOptionButton(AppAssets.instagramwhite,
                //           "LINK YOUR\nSOCIAL PROFILES"),
                //     ],
                //   ),
                // ),
                20.h.verticalSpace,
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.r),
                    child: AppButton(onPressed: () {}, text: "EDIT PROFILE")),
                61.h.verticalSpace,
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
                      width: 46.w,
                    ),
                  );
                },
              ),
              const Spacer(),
              SvgPicture.asset(
                AppAssets.notification,
                width: 46.w,
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 41.h, vertical: 10.h),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 23.w,
        ),
        height: 100.h,
        width: 352.w,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.darkredcolor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icons,
              width: 40.r,
            ),
            50.h.horizontalSpace,
            GlobalText(
              textAlign: TextAlign.start,
              text,
              textStyle: textStyle18SemiBold.copyWith(
                color: AppColors.textcolor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
