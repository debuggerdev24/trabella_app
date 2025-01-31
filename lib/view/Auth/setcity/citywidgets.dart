import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
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
  final List<TextEditingController> _controllers = [];

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
    final authprovider = Provider.of<Authprovider>(context, listen: false);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalText(
            'What languages do you speak?',
            textStyle: textStyle20SemiBold.copyWith(
              color: AppColors.redcolor,
            ),
          ),
          110.h.verticalSpace,
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
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
                        child: GlobalText(
                          language,
                          textStyle: textStyle16.copyWith(
                              color: AppColors.textcolor, fontSize: 16.sp),
                        ));
                  }).toList(),
                  dropdownIcon: AppAssets.down,
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
          30.h.verticalSpace,
          AppButton(
            onPressed: () {
              authprovider.nextStep();
            },
            text: "NEXT",
          ),
          15.h.verticalSpace,
          Center(
            child: GestureDetector(
              onTap: () {
                authprovider.nextStep();
              },
              child: GlobalText(
                color: AppColors.greycolor,
                'Skip',
                textStyle: textStyle18SemiBold.copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.textcolor,
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

class SetName extends StatefulWidget {
  const SetName({super.key});

  @override
  State<SetName> createState() => _SetNameState();
}

class _SetNameState extends State<SetName> {
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

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
            controller: _dateController,
            readOnly: true,
            fillcolor: Colors.transparent,
            labelText: "Date of Birth",
            style: const TextStyle(color: AppColors.textcolor),
            labelStyle:
                textStyle18SemiBold.copyWith(color: AppColors.blackColor),
            hintText: _dateController.text.isEmpty
                ? "DD/MM/YY"
                : _dateController.text,
            suffixIcon: GestureDetector(
              onTap: () {
                CustomDatePickers.showPicker(
                  context: context,
                  // mode: CupertinoDatePickerMode.date,
                  initialDateTime: stepperProvider.selectedDate,
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
                padding: EdgeInsets.all(15.sp),
                child: Image.asset(
                  AppAssets.birthDate,
                  height: 10.sp,
                ),
              ),
            ),
          ),
          20.h.verticalSpace,
          AppTextField(
            readOnly: true,
            controller: _timeController,
            fillcolor: Colors.transparent,
            labelText: "Birth Time",
            style: TextStyle(color: AppColors.textcolor),
            labelStyle:
                textStyle18SemiBold.copyWith(color: AppColors.blackColor),
            hintText: DateFormat('hh:mm a').format(stepperProvider.initialTime),
            suffixIcon: GestureDetector(
              onTap: () {
                CustomDatePickers.showPicker(
                  context: context,
                  // mode: CupertinoDatePickerMode.time,
                  initialDateTime: stepperProvider.initialTime,
                  onDateTimeChanged: (value) {
                    stepperProvider.updateTime(value);
                    setState(() {
                      _timeController.text =
                          DateFormat('hh:mm a').format(value);
                    });
                  },
                );
              },
              child: Padding(
                padding: EdgeInsets.all(15.sp),
                child: Image.asset(
                  AppAssets.birthTime,
                  height: 10.sp,
                ),
              ),
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
                stepperProvider.nextStep();
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
    "YOGA",
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
          'Choose 5 things you’re really into',
          textAlign: TextAlign.start,
          textStyle: textStyle20SemiBold.copyWith(
              color: AppColors.redcolor,
              fontSize: 30.sp,
              fontWeight: FontWeight.w600),
        ),
        30.h.verticalSpace,

        Wrap(
          alignment: WrapAlignment.start,
          spacing: 5,
          runSpacing: 5,
          children: List.generate((hobbies.length / 2).ceil(), (index) {
            int firstIndex = index * 2;
            int secondIndex = firstIndex + 1;
            return Row(
              children: [
                Expanded(
                  child: AppChip(
                    text: hobbies[firstIndex],
                    isSelected:
                        selectedDestinations.contains(hobbies[firstIndex]),
                    onTap: () {
                      setState(() {
                        if (selectedDestinations
                            .contains(hobbies[firstIndex])) {
                          selectedDestinations.remove(hobbies[firstIndex]);
                        } else {
                          selectedDestinations.add(hobbies[firstIndex]);
                        }
                      });
                    },
                  ),
                ),
                if (secondIndex < hobbies.length)
                  AppChip(
                    text: hobbies[secondIndex],
                    isSelected:
                        selectedDestinations.contains(hobbies[secondIndex]),
                    onTap: () {
                      setState(() {
                        if (selectedDestinations
                            .contains(hobbies[secondIndex])) {
                          selectedDestinations.remove(hobbies[secondIndex]);
                        } else {
                          selectedDestinations.add(hobbies[secondIndex]);
                        }
                      });
                    },
                  ),
              ],
            );
          }),
        ),

        // Wrap(
        //   alignment: WrapAlignment.start,
        //   spacing: 5,
        //   runSpacing: 5,
        //   children: hobbies.map((hobbies) {
        //     bool isSelected = selectedDestinations.contains(hobbies);
        //     return AppChip(
        //       text: hobbies,
        //       isSelected: isSelected,
        //       onTap: () {
        //         setState(() {
        //           if (isSelected) {
        //             selectedDestinations.remove(hobbies);
        //           } else {
        //             selectedDestinations.add(hobbies);
        //           }
        //         });
        //       },
        //     );
        //   }).toList(),
        // ),

        40.h.verticalSpace,
        AppButton(
          onPressed: () {
            context.pushReplacementNamed(AppRoute.loginscreen.name);

            // context.pushNamed(AppRoute.thisorthatscreen.name);
          },
          text: "NEXT",
        ),
        20.h.verticalSpace,
        GestureDetector(
          onTap: () {
            stepperProvider.nextStep();
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
    "MACHU PICHHU",
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
          alignment: WrapAlignment.start,
          spacing: 5,
          runSpacing: 5,
          children: List.generate((destinations.length / 2).ceil(), (index) {
            int firstIndex = index * 2;
            int secondIndex = firstIndex + 1;
            return Row(
              children: [
                Expanded(
                  child: AppChip(
                    text: destinations[firstIndex],
                    isSelected:
                        selectedDestinations.contains(destinations[firstIndex]),
                    onTap: () {
                      setState(() {
                        if (selectedDestinations
                            .contains(destinations[firstIndex])) {
                          selectedDestinations.remove(destinations[firstIndex]);
                        } else {
                          selectedDestinations.add(destinations[firstIndex]);
                        }
                      });
                    },
                  ),
                ),
                if (secondIndex < destinations.length)
                  AppChip(
                    text: destinations[secondIndex],
                    isSelected: selectedDestinations
                        .contains(destinations[secondIndex]),
                    onTap: () {
                      setState(() {
                        if (selectedDestinations
                            .contains(destinations[secondIndex])) {
                          selectedDestinations
                              .remove(destinations[secondIndex]);
                        } else {
                          selectedDestinations.add(destinations[secondIndex]);
                        }
                      });
                    },
                  ),
              ],
            );
          }),
        ),
        40.h.verticalSpace,
        AppButton(
          onPressed: () {
            stepperProvider.nextStep();
          },
          text: "NEXT",
        ),
        20.h.verticalSpace,
        GestureDetector(
          onTap: () {
            stepperProvider.nextStep();
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
      ],
    );
  }
}
