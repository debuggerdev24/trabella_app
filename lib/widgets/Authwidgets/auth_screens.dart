import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/provider/auth_provider.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/routes/route.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/app_txt_field.dart';
import 'package:travel_app/widgets/date_picker.dart';

class Setbirthday extends StatefulWidget {
  const Setbirthday({super.key});

  @override
  State<Setbirthday> createState() => _SetbirthdayState();
}

class _SetbirthdayState extends State<Setbirthday> {
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final stepperProvider = Provider.of<Authprovider>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: 'When is your birthday, ',
              style: textstyle30semiBold.copyWith(
                color: AppColors.redcolor,
                fontSize: 30.sp,
                fontWeight: FontWeight.w600,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Trabella?',
                  style: textstyle30semiBold.copyWith(
                      color:
                          AppColors.redcolor, // Set a different color or style
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
          149.h.verticalSpace,
          AppTextField(
            readOnly: true,
            controller: _dateController,
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
                  AppAssets.datepicker,
                  height: 10.sp,
                ),
              ),
            ),
          ),
          36.h.verticalSpace,
          AppButton(
            onPressed: () {
              stepperProvider.nextStep();
              if (stepperProvider.currentStep == 4) {}
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

class Setpassword extends StatefulWidget {
  Setpassword({super.key});

  @override
  State<Setpassword> createState() => _SetpasswordState();
}

class _SetpasswordState extends State<Setpassword> {
  final TextEditingController _setpasswordcontroller = TextEditingController();

  Widget build(BuildContext context) {
    final stepperProvider = Provider.of<Authprovider>(context, listen: false);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalText(
            'Secure the account\nwith your secret word\nand number',
            textStyle: textstyle30semiBold.copyWith(
                color: AppColors.redcolor,
                fontSize: 30.sp,
                fontWeight: FontWeight.w600),
          ),
          110.h.verticalSpace,
          AppTextField(
            fillcolor: Colors.transparent,
            controller: _setpasswordcontroller,
            hintText: "Choose your password",
            suffixIcon: Image.asset(AppAssets.password),
            onChanged: (String? value) {
              stepperProvider.updatePassword(value ?? "");
            },
          ),
          36.h.verticalSpace,
          AppButton(
            onPressed: () {
              stepperProvider.nextStep();
              if (stepperProvider.currentStep == 0) {
                stepperProvider.nextStep();
              }
            },
            text: "NEXT",
          ),
        ],
      ),
    );
  }
}

class Setlocation extends StatefulWidget {
  const Setlocation({super.key});

  @override
  State<Setlocation> createState() => _SetlocationState();
}

class _SetlocationState extends State<Setlocation> {
  Location location = Location();

  @override
  void initState() {
    super.initState();
    requestLocationPermission();
  }

  @override
  Widget build(BuildContext context) {
    final stepperProvider = Provider.of<Authprovider>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Where do you live,\n', // Main part of the text
            style: textstyle30semiBold.copyWith(
              color: AppColors.redcolor,
              fontSize: 30.sp,
              fontWeight: FontWeight.w600,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'Thalia?', // The second part of the text
                style: textstyle30semiBold.copyWith(
                    color: AppColors
                        .redcolor, // Optional: change the color or style
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
        145.h.verticalSpace,
        AppTextField(
          fillcolor: Colors.transparent,
          labelText: "Location",
          labelStyle: textStyle18SemiBold.copyWith(color: AppColors.blackColor),
          hintText: "Enter your location",
          onChanged: (value) {
            stepperProvider.updatePassword(value ?? "");
          },
        ),
        36.h.verticalSpace,
        AppButton(
          onPressed: () {
            context.pushNamed(AppRoute.notifictionscreen.name);
            stepperProvider.jumpToStep(0);
          },
          text: "NEXT",
        ),
        10.h.verticalSpace,
        Center(
          child: GestureDetector(
            onTap: () {
              context.pushNamed(AppRoute.notifictionscreen.name);
              stepperProvider.jumpToStep(0);
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
    );
  }

  Future requestLocationPermission() async {
    bool serviceEnabled;
    PermissionStatus permissionStatus;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        return;
      }
    }
  }
}
