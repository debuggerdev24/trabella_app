import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:travel_app/provider/trips_provider.dart';
import 'package:travel_app/utils/app_assets.dart';

import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/widgets/app_txt_field.dart';

class Mapscreen extends StatelessWidget {
  final List<Map<String, dynamic>> restaurants = [
    {
      'image': AppAssets.homebackground,
      'name': "Yuni's Kitchen",
      'category': 'Restaurant',
      'rating': 4.7,
      'reviews': 307,
    },
    {
      'image': AppAssets.homebackground,
      'name': 'Pasta Palace',
      'category': 'Restaurant',
      'rating': 4.5,
      'reviews': 155,
    },
  ];

  Mapscreen({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final TripProvider provider;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          zoomControlsEnabled: true,
          initialCameraPosition: CameraPosition(
              zoom: 14.0, target: LatLng(37.42796133580664, -122.085749655962)),
        ),
        Positioned(
            right: 90,
            top: 20,
            left: 20,
            bottom: 30,
            child: AppTextField(
              prefixIcon: const Icon(Icons.search),
              hintText: "Search",
              fillcolor: AppColors.whiteColor,
              contentPadding: EdgeInsets.symmetric(horizontal: 30.r),
            )),
        Positioned(
            right: 20,
            top: 18,
            child: GestureDetector(
              onTap: () {
                provider.chnageShowSaved();
              },
              child: Container(
                width: 50.w,
                height: 50.h,
                decoration: BoxDecoration(
                    color: AppColors.darkredcolor,
                    borderRadius: BorderRadius.circular(12)),
                child: Icon(
                  Icons.bookmark_outline,
                  color: AppColors.whiteColor,
                ),
              ),
            )),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedContainer(
                width: double.infinity,
                height: provider.isShowSaved ? 0.3.sh : 0,
                duration: const Duration(milliseconds: 200),
                decoration:
                    BoxDecoration(color: const Color(0xffFFFEF9), boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, -5),
                      blurRadius: 20)
                ]),
                child: provider.isShowSaved
                    ? SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: IconButton(
                                  onPressed: () {
                                    provider.chnageShowSaved();
                                  },
                                  icon: SvgIcon(
                                    AppAssets.down,
                                    size: 30.w,
                                  )),
                            ),
                            _savedplace(),
                          ],
                        ),
                      )
                    : SizedBox()))
      ],
    );
  }

  Widget _savedplace() {
    ScrollController _scrollController = ScrollController();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Places you saved",
              style: textStyle18.copyWith(
                  color: AppColors.textcolor,
                  fontWeight: FontWeight.w600,
                  fontSize: 24.sp)),
          SizedBox(height: 25.h),
          SizedBox(
            height: 500.h,
            child: Scrollbar(
              scrollbarOrientation: ScrollbarOrientation.bottom,
              thumbVisibility: true,
              controller: _scrollController,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: restaurants.length,
                separatorBuilder: (context, index) => Divider(
                  color: AppColors.blackColor,
                ),
                itemBuilder: (context, index) {
                  final restaurant = restaurants[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 120.w,
                          height: 120.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: Image.asset(
                              restaurant['image'].toString(),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                restaurant['name'].toString(),
                                style: textStyle18.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textcolor),
                              ),
                              Text(
                                restaurant['category'].toString(),
                                style: textStyle18.copyWith(
                                  color: AppColors.textcolor,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${restaurant['rating']}',
                                    style: textStyle14,
                                  ),
                                  5.w.horizontalSpace,
                                  RatingBarIndicator(
                                    rating: restaurant['rating'],
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star,
                                      color: AppColors.darkredcolor,
                                    ),
                                    itemCount: 5,
                                    itemSize: 16.w,
                                  ),
                                  SizedBox(width: 5.w),
                                  SizedBox(width: 5.w),
                                  Text(
                                    '(${restaurant['reviews']})',
                                    style: textStyle14.copyWith(
                                        color: AppColors.greycolor),
                                  ),
                                ],
                              ),
                              10.h.verticalSpace,
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.bookmark,
                                      size: 30.w,
                                      color: AppColors.darkredcolor,
                                    ),
                                  ),
                                  5.w.horizontalSpace,
                                  SvgIcon(
                                    AppAssets.circleinfo,
                                    size: 23.w,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
