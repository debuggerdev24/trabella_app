import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/provider/auth_provider.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/app_txt_field.dart';
import 'package:travel_app/widgets/date_picker.dart';
import 'package:travel_app/widgets/destination_chip.dart';
import 'package:travel_app/widgets/dropdown_txt_filed.dart';

class LanguageSelection extends StatefulWidget {
  LanguageSelection({super.key});

  @override
  State<LanguageSelection> createState() => _LanguageSelectionState();
}

class _LanguageSelectionState extends State<LanguageSelection> {
  List<String?> selectedLanguages = ['English'];
  List<TextEditingController> _controllers = [];

  @override
  void initState() {
    super.initState();
    _controllers.add(TextEditingController());
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _addLanguageField() {
    setState(() {
      _controllers.add(TextEditingController());
      selectedLanguages.add("English");
    });
  }

  @override
  Widget build(BuildContext context) {
    final stepperProvider = Provider.of<Authprovider>(context, listen: false);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalText(
            'What languages do you speak?',
            textStyle: textStyle20SemiBold.copyWith(
              color: AppColors.redcolor,
              fontSize: 30.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          110.h.verticalSpace,
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _controllers.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: CardDropDownField(
                  value: selectedLanguages[index],
                  onChanged: (value) {
                    setState(() {
                      selectedLanguages[index] = value;
                    });
                  },
                  dropDownList: ['English', 'Spanish', 'French', 'German']
                      .map((language) {
                    return DropdownMenuItem<String>(
                      value: language,
                      child: Text(language),
                    );
                  }).toList(),
                ),
              );
            },
          ),
          20.h.verticalSpace,
          GestureDetector(
            onTap: () {
              _addLanguageField();
            },
            child: Center(
              child: SvgPicture.asset(
                AppAssets.addlanguage,
              ),
            ),
          ),
          20.h.verticalSpace,
          AppButton(
            onPressed: () {
              stepperProvider.nextStep();
            },
            text: "NEXT",
          ),
          10.h.verticalSpace,
          Center(
            child: GestureDetector(
              onTap: () {},
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

class SetName extends StatelessWidget {
  const SetName({super.key});

  @override
  Widget build(BuildContext context) {
    final stepperProvider = Provider.of<Authprovider>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GlobalText(
            'Do you want to set up your birth chart?',
            textStyle: textStyle20SemiBold.copyWith(
                color: AppColors.redcolor,
                fontSize: 30.sp,
                fontWeight: FontWeight.w600),
          ),
          53.h.verticalSpace,
          AppTextField(
              fillcolor: Colors.transparent,
            labelText: "Date of Birth",
            labelStyle:
                textStyle18SemiBold.copyWith(color: AppColors.blackColor),
            hintText: "${stepperProvider.selectedDate.toLocal()}".split(' ')[0],
            suffixIcon: GestureDetector(
              onTap: () {
                log("ontappp=====>");
                CustomDatePickers.showPicker(
                  context: context,
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: stepperProvider.selectedDate,
                  onDateTimeChanged: (value) {
                    stepperProvider.updateDate(value);
                  },
                );
              },
              child: Image.asset(AppAssets.date),
            ),
          ),
          20.h.verticalSpace,
          AppTextField(
              fillcolor: Colors.transparent,
            labelText: "Birth Time",
            labelStyle:
                textStyle18SemiBold.copyWith(color: AppColors.blackColor),
            hintText: "${stepperProvider.selectedDate.toLocal()}".split(' ')[0],
            suffixIcon: GestureDetector(
              onTap: () {
                CustomDatePickers.showPicker(
                  context: context,
                  mode: CupertinoDatePickerMode.time,
                  initialDateTime: stepperProvider.selectedDate,
                  onDateTimeChanged: (value) {
                    stepperProvider.updateDate(value);
                  },
                );
              },
              child: Image.asset(AppAssets.datepicker),
            ),
          ),
          20.h.verticalSpace,
          AppTextField(
              fillcolor: Colors.transparent,
            labelStyle:
                textStyle18SemiBold.copyWith(color: AppColors.blackColor),
            labelText: "Birth Place",
            hintText: "New York",
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
                stepperProvider.jumpToStep(5);
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

class Favouritethings extends StatefulWidget {
  Favouritethings({super.key});

  @override
  State<Favouritethings> createState() => _FavouritethingsState();
}

class _FavouritethingsState extends State<Favouritethings> {
  Set<String> selectedDestinations = {};
  get stepperProvider => null;

  final List<String> hobbies = [
    "HIKING",
    "BAKING",
    "GARDENING",
    "YoGA",
    "MOVIES",
    "FESTIVALS",
    "GALLERIES",
    "FOODIE",
    "GARDENING",
    "DIVING",
    "CAMPING",
    "MUSIC",
  ];

  @override
  Widget build(BuildContext context) {
    final stepperProvider = Provider.of<Authprovider>(context);

    return Column(
      children: [
        GlobalText(
          'Choose top 5 holiday destinations',
          textStyle: textStyle20SemiBold.copyWith(
              color: AppColors.redcolor,
              fontSize: 30.sp,
              fontWeight: FontWeight.w600),
        ),
        30.h.verticalSpace,
        Wrap(
          children: hobbies.map((hobbies) {
            bool isSelected = selectedDestinations.contains(hobbies);
            return AppChip(
              text: hobbies,
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  if (isSelected) {
                    selectedDestinations.remove(hobbies);
                  } else {
                    selectedDestinations.add(hobbies);
                  }
                });
              },
            );
          }).toList(),
        ),
        40.h.verticalSpace,
        AppButton(
          onPressed: () {
            stepperProvider.nextStep();
          },
          text: "NEXT",
        ),
        20.h.verticalSpace,
        GlobalText(
          color: AppColors.greycolor,
          'Skip',
          textStyle: textStyle18SemiBold.copyWith(
            decoration: TextDecoration.underline,
            decorationColor: AppColors.textcolor.withOpacity(0.8),
            color: AppColors.textcolor.withOpacity(0.8),
          ),
        ),
      ],
    );
  }
}

class Holidaydestination extends StatefulWidget {
  const Holidaydestination({super.key});

  @override
  _HolidaydestinationState createState() => _HolidaydestinationState();
}

class _HolidaydestinationState extends State<Holidaydestination> {
  Set<String> selectedDestinations = {};

  final List<String> destinations = [
    "MELBOURNE",
    "NEW YORK",
    "BUENOS AIRES",
    "BALI",
    "TOKYO",
    "COPENHAGEN",
    "LONDON",
    "BEIJING",
    "HO CHI MINH",
    "PARIS",
    "BERLIN",
    "MACHU PICHHU"
  ];

  @override
  Widget build(BuildContext context) {
    final stepperProvider = Provider.of<Authprovider>(context);

    return Column(
      children: [
        GlobalText(
          'Choose top 5 holiday destinations',
          textStyle: textStyle20SemiBold.copyWith(
              color: AppColors.redcolor,
              fontSize: 30.sp,
              fontWeight: FontWeight.w600),
        ),
        30.h.verticalSpace,
        Wrap(
          children: destinations.map((destination) {
            bool isSelected = selectedDestinations.contains(destination);
            return AppChip(
              text: destination,
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  if (isSelected) {
                    selectedDestinations.remove(destination);
                  } else {
                    selectedDestinations.add(destination);
                  }
                });
              },
            );
          }).toList(),
        ),
        40.h.verticalSpace,
        AppButton(
          onPressed: () {
            stepperProvider.nextStep();
          },
          text: "NEXT",
        ),
        20.h.verticalSpace,
        GlobalText(
          color: AppColors.greycolor,
          'Skip',
          textStyle: textStyle18SemiBold.copyWith(
            decoration: TextDecoration.underline,
            decorationColor: AppColors.textcolor.withOpacity(0.8),
            color: AppColors.textcolor.withOpacity(0.8),
          ),
        ),
      ],
    );
  }
}
