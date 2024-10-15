import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/provider/auth_provider.dart';
import 'package:travel_app/tabs/tabs.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/routes/route.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/app_txt_field.dart';
import 'package:travel_app/widgets/back_button.dart';
import 'package:travel_app/widgets/date_picker.dart';
import 'package:travel_app/widgets/dropdown_txt_filed.dart';
import 'package:travel_app/widgets/profilc_pic.dart';

import '../../provider/home_provider.dart';

class MyprofileScreen extends StatefulWidget {
  const MyprofileScreen({super.key});

  @override
  State<MyprofileScreen> createState() => _MyprofileScreenState();
}

class _MyprofileScreenState extends State<MyprofileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroungcolor,
      body: Consumer2<Authprovider, HomeProvider>(
          builder: (context, authProvider, homeProvider, _) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                100.h.verticalSpace,
                KBackButton(
                    color: AppColors.darkredcolor,
                    iconcolor: AppColors.backgroungcolor),
                60.h.verticalSpace,
                GlobalText(
                  'My Profile',
                  textStyle: textStyle20SemiBold.copyWith(
                      color: AppColors.darkredcolor,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600),
                ),
                20.h.verticalSpace,
                Center(
                  child: ProfilePic(
                    image: AppAssets.myprofile2,
                  ),
                ),
                AppTextField(
                  fillcolor: Colors.transparent,
                  labelText: "Name",
                  labelStyle:
                      textStyle18SemiBold.copyWith(color: AppColors.blackColor),
                  hintText: "Thalia Economo",
                ),
                20.h.verticalSpace,
                AppTextField(
                  fillcolor: Colors.transparent,
                  labelText: "Nickname",
                  labelStyle:
                      textStyle18SemiBold.copyWith(color: AppColors.blackColor),
                  hintText: "Thalia",
                ),
                20.h.verticalSpace,
                AppTextField(
                  fillcolor: Colors.transparent,
                  labelText: "Date of Birth",
                  labelStyle:
                      textStyle18SemiBold.copyWith(color: AppColors.blackColor),
                  hintText:
                      "${authProvider.selectedDate.toLocal()}".split(' ')[0],
                  suffixIcon: GestureDetector(
                    onTap: () {
                      CustomDatePickers.showPicker(
                        context: context,
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: authProvider.selectedDate,
                        onDateTimeChanged: (value) {
                          authProvider.updateDate(value);
                        },
                      );
                    },
                    child: Image.asset(AppAssets.datepicker),
                  ),
                ),
                20.h.verticalSpace,
                GlobalText(
                  "Where are you based?",
                  textStyle: textStyle16.copyWith(
                      color: AppColors.blackColor, fontWeight: FontWeight.w600),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CardDropDownField(
                        hintText: "Australia",
                        value: homeProvider.selectedcountry,
                        onChanged: (value) {
                          homeProvider.changeSelectedCountry(value);
                        },
                        dropDownList: countrydropdownlist())),
                20.h.verticalSpace,
                AppTextField(
                  fillcolor: Colors.transparent,
                  maxLength: 200,
                  labelText: "Bio",
                  labelStyle:
                      textStyle18SemiBold.copyWith(color: AppColors.blackColor),
                  hintText: "I’m Thalia.I’m a creative director from...",
                ),
                20.h.verticalSpace,
                AppTextField(
                  fillcolor: Colors.transparent,
                  maxLength: 200,
                  labelText: "Emergency contact",
                  labelStyle:
                      textStyle18SemiBold.copyWith(color: AppColors.blackColor),
                  hintText: "Trabella Travel",
                ),
                20.h.verticalSpace,
                AppTextField(
                  fillcolor: Colors.transparent,
                  maxLength: 200,
                  labelText: "Emergency contact email ",
                  labelStyle:
                      textStyle18SemiBold.copyWith(color: AppColors.blackColor),
                  hintText: "trabella@travel.com",
                ),
                20.h.verticalSpace,
                AppTextField(
                  fillcolor: Colors.transparent,
                  maxLength: 200,
                  labelText: "Languages ",
                  labelStyle:
                      textStyle18SemiBold.copyWith(color: AppColors.blackColor),
                  hintText: "English, Spanish",
                ),
                20.h.verticalSpace,
                AppTextField(
                  fillcolor: Colors.transparent,
                  labelText: "Zodiac",
                  labelStyle:
                      textStyle18SemiBold.copyWith(color: AppColors.blackColor),
                  hintText: "Sun: Sagittarius",
                ),
                20.h.verticalSpace,
                AppTextField(
                  fillcolor: Colors.transparent,
                  labelStyle:
                      textStyle18SemiBold.copyWith(color: AppColors.blackColor),
                  hintText: "Rising: Sagittarius",
                ),
                30.h.verticalSpace,
                AppButton(
                    onPressed: () {
                      context.pushNamed(AppRoute.settingscreen.name);
                    },
                    text: "SUBMIT"),
                20.h.verticalSpace
              ],
            ),
          ),
        );
      }),
    );
  }

  List<DropdownMenuItem<String>> countrydropdownlist() =>
      ['Australia', 'Germany', 'Canada', 'USA']
          .map(
            (country) => DropdownMenuItem(
              value: country,
              child: Text(
                country,
                style: textStyle16,
              ),
            ),
          )
          .toList();
}
