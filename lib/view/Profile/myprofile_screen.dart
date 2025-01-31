import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/provider/auth_provider.dart';
import 'package:travel_app/provider/profile_provider.dart';
import 'package:travel_app/tabs/tabs.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/enum/edit_profie_tab_enum.dart';
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
  final TextEditingController _dateController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroungcolor,
      body: Consumer3<Authprovider, HomeProvider, ProfileProvider>(
          builder: (context, authProvider, homeProvider, profileprovider, _) {
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
                81.h.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: profileTab(
                          value: EditProfileEnum.edit,
                          currentValue: profileprovider.currentEditTab,
                          onTap: (value) {
                            profileprovider.changeProfileTab(value);
                          }),
                    ),
                    Expanded(
                      child: profileTab(
                          value: EditProfileEnum.preview,
                          currentValue: profileprovider.currentEditTab,
                          onTap: (value) {
                            profileprovider.changeProfileTab(value);
                          }),
                    ),
                  ],
                ),
                20.h.verticalSpace,
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
                  readOnly: true,
                  controller: _dateController,
                  fillcolor: Colors.transparent,
                  labelText: "Date of Birth",
                  labelStyle:
                      textStyle18SemiBold.copyWith(color: AppColors.blackColor),
                  hintText: _dateController.text.isEmpty
                      ? "DD/MM/YY"
                      : _dateController.text,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      CustomDatePickers.showPicker(
                        context: context,
                        initialDateTime: authProvider.selectedDate,
                        onDateTimeChanged: (DateTime value) {
                          final formattedDate =
                              DateFormat('dd/MM/yyyy').format(value);
                          setState(() {
                            _dateController.text = formattedDate;
                          });
                        },
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Image.asset(
                        AppAssets.birthDate,
                        height: 12.sp,
                      ),
                    ),
                  ),
                ),
                10.h.verticalSpace,
                GlobalText(
                  "Where are you based?",
                  textStyle: textStyle16.copyWith(
                      color: AppColors.blackColor, fontWeight: FontWeight.w600),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CardDropDownField(
                        dropdownIcon: AppAssets.down,
                        hintText: "Select Country",
                        value: homeProvider.selectedcountry,
                        onChanged: (value) {
                          homeProvider.changeSelectedCountry(value);
                        },
                        dropDownList: countrydropdownlist())),
                10.h.verticalSpace,
                AppTextField(
                  fillcolor: Colors.transparent,
                  maxLength: 200,
                  labelText: "Emergency contact",
                  labelStyle:
                      textStyle18SemiBold.copyWith(color: AppColors.blackColor),
                  hintText: "Trabella Travel",
                ),
                10.h.verticalSpace,
                AppTextField(
                  fillcolor: Colors.transparent,
                  maxLength: 200,
                  labelText: "Emergency contact email ",
                  labelStyle:
                      textStyle18SemiBold.copyWith(color: AppColors.blackColor),
                  hintText: "trabella@travel.com",
                ),
                10.h.verticalSpace,
                AppTextField(
                  fillcolor: Colors.transparent,
                  maxLength: 200,
                  labelText: "Bio",
                  labelStyle:
                      textStyle18SemiBold.copyWith(color: AppColors.blackColor),
                  hintText: "I’m Thalia.I’m a creative director from...",
                ),
                10.h.verticalSpace,
                AppTextField(
                  fillcolor: Colors.transparent,
                  maxLength: 200,
                  labelText: "Languages ",
                  labelStyle:
                      textStyle18SemiBold.copyWith(color: AppColors.blackColor),
                  hintText: "English, Spanish",
                ),
                10.h.verticalSpace,
                AppTextField(
                  fillcolor: Colors.transparent,
                  labelText: "Zodiac",
                  labelStyle:
                      textStyle18SemiBold.copyWith(color: AppColors.blackColor),
                  hintText: "Sun: Sagittarius",
                ),
                10.h.verticalSpace,
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

  Widget profileTab(
      {required EditProfileEnum value,
      required EditProfileEnum currentValue,
      required Function(EditProfileEnum) onTap}) {
    return InkWell(
      onTap: () {
        if (value == currentValue) return;
        onTap(value);
      },
      borderRadius: BorderRadius.circular(10.r),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 43,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: value == currentValue
                ? AppColors.darkredcolor
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10.r)),
        child: GlobalText(value.getTitle(),
            textStyle: textStyle16.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: value == currentValue
                    ? AppColors.whiteColor
                    : AppColors.textcolor)),
      ),
    );
  }
}
