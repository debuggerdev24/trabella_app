import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/provider/auth_provider.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/view/auth/setcity/citywidgets.dart';

import 'package:travel_app/widgets/back_button.dart';
import 'package:travel_app/widgets/steeper.dart';

class SetcityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stepperProvider = Provider.of<Authprovider>(context);
    final PageController _pageController =
        PageController(initialPage: stepperProvider.currentStep);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_pageController.hasClients) {
        _pageController.jumpToPage(stepperProvider.currentStep);
      }
    });

    return Scaffold(
      backgroundColor: AppColors.backgroungcolor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            100.h.verticalSpace,
            // const Customstepper(
            //     // stepCount: 6,
            //     ),
            const Customstepper1(stepCount: 5),
            60.h.verticalSpace,
            KBackButton(
              onBackClick: () {
                stepperProvider.previousStep();
              },
              color: AppColors.darkredcolor,
              iconcolor: AppColors.backgroungcolor,
            ),
            60.h.verticalSpace,
            Expanded(
              child: Container(
                height: double.infinity,
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (index) {
                    stepperProvider.jumpToStep(index);
                  },
                  children: [
                    LanguageSelection(),
                    const SetName(),
                    const Holidaydestination(),
                    Favouritethings(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
