import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/provider/profile_provider.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/darwer_tile.dart';
import 'package:travel_app/widgets/destination_chip.dart';
import 'package:travel_app/widgets/my_basic.dart';
import 'package:travel_app/widgets/top_bar.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<String> imageUrls = [
    AppAssets.slider1,
    AppAssets.slider2,
    AppAssets.slider3
  ];

  final List<Map<String, String>> stamps = [
    {"image": AppAssets.stemp1, "label": "Stamp 1"},
    {"image": AppAssets.stemp2, "label": "Stamp 2"},
    {"image": AppAssets.stemp3, "label": "Stamp 3"},
    {"image": AppAssets.stemp4, "label": "Stamp 4"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      backgroundColor: AppColors.backgroungcolor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            profieview(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 42.w, vertical: 60.h),
              child: Text.rich(
                TextSpan(
                  text: "About me",
                  style: textStyle16.copyWith(
                      fontSize: 24.sp,
                      color: AppColors.darkredcolor,
                      fontWeight: FontWeight.w600),
                  children: [
                    TextSpan(
                      text:
                          "\nWith a passion for photography, I love capturing the beauty of my journeys, and I often find inspiration in the stories of the people I meet along the way.",
                      style: textStyle18.copyWith(
                          color: AppColors.textcolor,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 219.h,
              width: double.infinity,
              color: AppColors.textcolor.withOpacity(0.1),
              child: Padding(
                padding: EdgeInsets.only(left: 38.r, top: 39.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GlobalText(
                      "My basic",
                      textStyle: textStyle18SemiBold.copyWith(
                          color: AppColors.textcolor),
                    ),
                    16.h.verticalSpace,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Wrap(spacing: 16.w, children: [
                            MyBasic(
                              text: "Venice, Italy",
                              icons: AppAssets.mappin,
                            ),
                            MyBasic(
                              text: "Melbourne, Australia",
                              icons: AppAssets.home,
                            ),
                            MyBasic(
                              text: "English, Spanish, Japanese",
                              icons: AppAssets.language,
                            ),
                          ]),
                        ],
                      ),
                    ),
                    10.h.verticalSpace,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Wrap(spacing: 16.w, children: [
                            MyBasic(
                              text: "Teacher",
                              icons: AppAssets.trips,
                            ),
                            MyBasic(
                              text: "Yes",
                              icons: AppAssets.cigerette,
                            ),
                            MyBasic(
                              text: "Yes",
                              icons: AppAssets.wine1,
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            28.h.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 38.w),
              child: GlobalText(
                "Zodiac signs",
                textStyle:
                    textStyle18SemiBold.copyWith(color: AppColors.textcolor),
              ),
            ),
            15.h.verticalSpace,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Row(
                  children: [
                    zodiacsign("Sagittarius", AppAssets.sagittarius),
                    zodiacsign("Taurus", AppAssets.taurus),
                    zodiacsign("Aquarius", AppAssets.aquarius),
                  ],
                ),
              ),
            ),
            38.h.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 38.w),
              child: GlobalText(
                "What my friends say about me",
                textStyle:
                    textStyle18SemiBold.copyWith(color: AppColors.textcolor),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 38.w, vertical: 10.h),
                child: Wrap(
                  spacing: 10.w,
                  children: [
                    friends("Fun"),
                    friends("Caring"),
                    friends("Quirky"),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 38.w,
                ),
                child: Wrap(
                  spacing: 10.w,
                  children: [
                    friends("Organised"),
                    friends("Sponteneous"),
                  ],
                ),
              ),
            ),
            40.h.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 38.w),
              child: GlobalText(
                "“This” or “That”?",
                textStyle:
                    textStyle18SemiBold.copyWith(color: AppColors.textcolor),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 38.w),
                child: Row(
                  children: [
                    thisorthat("Cat", AppAssets.cat),
                    thisorthat("Beer", AppAssets.beer),
                    thisorthat("Chocolate", AppAssets.chocolate),
                    thisorthat("Street food", AppAssets.streetfood),
                    thisorthat("Diving", AppAssets.diving),
                    thisorthat("Asia", AppAssets.asia),
                    thisorthat("Hotel", AppAssets.hotel),
                    thisorthat("Cities", AppAssets.city),
                  ],
                ),
              ),
            ),
            50.h.verticalSpace,
            stampcollection(),
          ],
        ),
      ),
    );
  }

  Widget profieview() {
    return Consumer<ProfileProvider>(builder: (context, profileprovider, _) {
      return Stack(
        children: [
          SizedBox(
            height: 577.h,
            child: CarouselSlider(
              options: CarouselOptions(
                height: double.infinity,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                onPageChanged: (index, reason) {
                  profileprovider.changeslidervalue(index);
                },
              ),
              items: imageUrls.map((imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    );
                  },
                );
              }).toList(),
            ),
          ),
          TopBar(),
          Positioned(
            bottom: 120,
            left: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Samantha, 51',
                        style: textStyle16Bold.copyWith(
                            fontSize: 40.sp, color: AppColors.backgroungcolor)),
                    64.w.horizontalSpace,
                    CircleAvatar(
                      backgroundColor: AppColors.darkredcolor,
                      radius: 20.r,
                      child: SvgIcon(
                        AppAssets.profilecheck,
                        size: 20.w,
                        color: AppColors.backgroungcolor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 90,
            left: 0,
            right: 0,
            child: Center(
              child: DotsIndicator(
                dotsCount: imageUrls.length,
                position: profileprovider.currentindex ?? 0,
                decorator: DotsDecorator(
                  activeColor: AppColors.darkredcolor,
                  color: AppColors.backgroungcolor,
                  size: Size(12.w, 12.h),
                  activeSize: Size(12.w, 12.h),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Center(
              child: AppButton(
                  borderRadius: BorderRadius.circular(12.r),
                  onPressed: () {},
                  text: "SEND REQUEST "),
            ),
          ),
        ],
      );
    });
  }

  Widget zodiacsign(final String text, String image) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      height: 45.h,
      width: 150.w,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            8.w.horizontalSpace,
            SvgPicture.asset(image),
            8.w.horizontalSpace,
            Expanded(
              child: GlobalText(
                text,
                textStyle: textStyle18.copyWith(color: AppColors.textcolor),
              ),
            ),
          ]),
    );
  }

  Widget friends(String text) {
    return IntrinsicWidth(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 13),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: GlobalText(
                  maxLine: 10,
                  text,
                  textStyle: textStyle16.copyWith(fontSize: 16.sp),
                ),
              ),
            ]),
      ),
    );
  }

  Widget thisorthat(final String text, final String image) {
    return Card(
      color: AppColors.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
            child: Image.asset(
              image,
              height: 180.h,
              width: 148.w,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: GlobalText(text,
                textStyle: textStyle16.copyWith(
                    color: AppColors.textcolor, fontSize: 16.sp)),
          ),
        ],
      ),
    );
  }

  Widget stampcollection() {
    return Container(
      color: AppColors.whiteColor,
      height: 550.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.h.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 38.w),
            child: Text("Samatha’s Stamp Collections",
                style: textStyle20SemiBold.copyWith(
                    color: AppColors.darkredcolor, fontSize: 24.sp)),
          ),
          5.h.verticalSpace,
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: stamps.length,
            itemBuilder: (context, index) {
              final stamp = stamps[index];
              return Column(
                children: [
                  Stack(
                    children: [
                      Image.asset(stamp['image']!, height: 160.h, width: 251.w),
                    ],
                  ),
                  8.h.verticalSpace,
                  Icon(
                    Icons.favorite_border,
                    size: 32.w,
                    color: AppColors.darkredcolor,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
