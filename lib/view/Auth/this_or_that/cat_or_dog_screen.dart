import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/tabs/tabs.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/routes/route.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/back_button.dart';
import 'package:travel_app/widgets/this_or_that.dart';

class CatOrDogScreen extends StatefulWidget {
  const CatOrDogScreen({super.key});

  @override
  _CatOrDogScreenState createState() => _CatOrDogScreenState();
}

class _CatOrDogScreenState extends State<CatOrDogScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroungcolor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70.h),
            Image.asset(AppAssets.steeper),
            SizedBox(height: 38.h),
            KBackButton(
              onBackClick: () {
                if (_currentPage > 0) {
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              color: AppColors.darkredcolor,
              iconcolor: AppColors.backgroungcolor,
            ),
            SizedBox(height: 60.h),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  ThisOrThat(
                    pagecontroller: _pageController,
                    thisimage: AppAssets.cat,
                    thatimage: AppAssets.dog,
                    text: "Cats or Dogs?",
                    ontap: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    onpressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                  ThisOrThat(
                    thisimage: AppAssets.beer,
                    thatimage: AppAssets.wine,
                    text: "Beer or Wine?",
                    pagecontroller: _pageController,
                    ontap: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    onpressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                  ThisOrThat(
                    thisimage: AppAssets.chocolate,
                    thatimage: AppAssets.pretzel,
                    text: "Chocolate or Pretzels?",
                    pagecontroller: _pageController,
                    ontap: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    onpressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                  ThisOrThat(
                    thisimage: AppAssets.streetfood,
                    thatimage: AppAssets.restaurant,
                    text: "Restaurants or Street food?",
                    pagecontroller: _pageController,
                    ontap: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    onpressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                  ThisOrThat(
                    thisimage: AppAssets.diving,
                    thatimage: AppAssets.flying,
                    text: "Diving or Flying?",
                    pagecontroller: _pageController,
                    ontap: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    onpressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                  ThisOrThat(
                    thisimage: AppAssets.asia,
                    thatimage: AppAssets.europe,
                    text: "Asia or Europe?",
                    pagecontroller: _pageController,
                    ontap: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    onpressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                  ThisOrThat(
                    thisimage: AppAssets.hotel,
                    thatimage: AppAssets.villa,
                    text: "Hotel or Villa?",
                    pagecontroller: _pageController,
                    ontap: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    onpressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                  ThisOrThat(
                    thisimage: AppAssets.city,
                    thatimage: AppAssets.country,
                    text: "City or Country?",
                    pagecontroller: _pageController,
                    ontap: () {
                      context.goNamed(AppRoute.homescreen.name);
                    },
                    onpressed: () {
                      context.goNamed(AppRoute.homescreen.name);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
