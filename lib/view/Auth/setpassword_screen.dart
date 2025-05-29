// horizontal_stepper.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/provider/auth_provider.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/widgets/Authwidgets/auth_screens.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/app_txt_field.dart';
import 'package:travel_app/widgets/back_button.dart';
import 'package:travel_app/widgets/steeper.dart';

class HorizontalStepper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final stepperProvider = Provider.of<Authprovider>(context);
    final PageController _pageController =
        PageController(initialPage: stepperProvider.currentStep);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController.jumpToPage(stepperProvider.currentStep);
    });

    return Scaffold(
      backgroundColor: AppColors.backgroungcolor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            100.h.verticalSpace,
          const  Customstepper1(stepCount: 6),
            60.h.verticalSpace,
            KBackButton(
              onBackClick: () {
                stepperProvider.previousStep();
              },
              color: AppColors.darkredcolor,
              iconcolor: AppColors.backgroungcolor,
            ),
            70.h.verticalSpace,
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: (index) {
                  stepperProvider.jumpToStep(index);
                },
                children: [
                  Setpassword(),
                  _confirmpassword(context),
                  _name(context),
                  _nickname(context),
                  const Setbirthday(),
                  const Setlocation(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _confirmpassword(BuildContext context) {
    final stepperProvider = Provider.of<Authprovider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalText(
            'Let’s see if you\nremember your\nmagic word',
            textStyle: textstyle30semiBold.copyWith(
              color: AppColors.redcolor,
            ),
          ),
          110.h.verticalSpace,
          AppTextField(
            fillcolor: Colors.transparent,
            hintText: "Confirm your password",
            suffixIcon: Padding(
                padding: EdgeInsets.only(left: 10.r),
              child: Image.asset(AppAssets.password),
            ),
            onChanged: (value) {
              stepperProvider.updateConfirmPassword(value ?? "");
            },
          ),
          36.h.verticalSpace,
          AppButton(
            onPressed: () {
              stepperProvider.nextStep();
            },
            text: "NEXT",
          ),
        ],
      ),
    );
  }

  Widget _name(BuildContext context) {
    final stepperProvider = Provider.of<Authprovider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalText(
            'What’s your name?',
            textStyle: textstyle30semiBold.copyWith(
                color: AppColors.redcolor,
                fontSize: 30.sp,
                fontWeight: FontWeight.w600),
          ),
          148.h.verticalSpace,
          AppTextField(
            fillcolor: Colors.transparent,
            labelText: "First Name",
            
            hintText: "Trabella",
            onChanged: (value) {
              stepperProvider.updateFirstName(value ?? "");
            },
          ),
          20.h.verticalSpace,
          AppTextField(
            fillcolor: Colors.transparent,
            labelText: "Last Name",
         
            hintText: "Travel",
            onChanged: (value) {
              stepperProvider.updateLastName(value ?? "");
            },
          ),
          36.h.verticalSpace,
          AppButton(
            onPressed: () {
              stepperProvider.nextStep();
            },
            text: "NEXT",
          ),
        ],
      ),
    );
  }

  Widget _nickname(BuildContext context) {
    final stepperProvider = Provider.of<Authprovider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalText(
            'What shall we call you?',
            textStyle: textstyle30semiBold.copyWith(
              color: AppColors.redcolor,
            ),
          ),
          149.h.verticalSpace,
          AppTextField(
            fillcolor: Colors.transparent,
            labelText: "Nickname",
            hintText: "Trabella",
            onChanged: (value) {
              stepperProvider.updateNickname(value ?? "");
            },
          ),
          36.h.verticalSpace,
          AppButton(
            onPressed: () {
              stepperProvider.nextStep();
            },
            text: "NEXT",
          ),
          10.h.verticalSpace,
          Center(
            child: GestureDetector(
              onTap: () {
                stepperProvider.jumpToStep(4);
              },
              child: GlobalText(
                color: AppColors.greycolor,
                'Skip',
                textStyle: textStyle18SemiBold.copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.textcolor.withOpacity(0.8),
                  color: AppColors.textcolor.withOpacity(0.8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
