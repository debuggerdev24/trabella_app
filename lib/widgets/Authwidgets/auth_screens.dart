import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
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

class Setbirthday extends StatelessWidget {
  const Setbirthday({super.key});

  @override
  Widget build(BuildContext context) {
    final stepperProvider = Provider.of<Authprovider>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalText(
            'When is your birthday, Trabella?',
            textStyle: textStyle20SemiBold.copyWith(
                color: AppColors.redcolor,
                fontSize: 30.sp,
                fontWeight: FontWeight.w600),
          ),
          149.h.verticalSpace,
          AppTextField(
            labelText: "Date of Birth",
            labelStyle:
                textStyle18SemiBold.copyWith(color: AppColors.blackColor),
            hintText: "${stepperProvider.selectedDate.toLocal()}".split(' ')[0],
            suffixIcon: GestureDetector(
              onTap: () {
                showCupertinoModalPopup<void>(
                  context: context,
                  builder: (_) {
                    final size = MediaQuery.of(context).size;
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(2, 1),
                              blurRadius: 3,
                              color: AppColors.greycolor)
                        ],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18),
                        ),
                      ),
                      height: size.height * 0.27,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: stepperProvider.selectedDate,
                        onDateTimeChanged: (value) {
                          stepperProvider.updateDate(value);
                        },
                      ),
                    );
                  },
                );
              },
              child: Image.asset(AppAssets.datepicker),
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
        children: [
          GlobalText(
            'Secure the account\nwith your secret word\nand number',
            textStyle: textStyle20SemiBold.copyWith(
                color: AppColors.redcolor,
                fontSize: 30.sp,
                fontWeight: FontWeight.w600),
          ),
          110.h.verticalSpace,
          AppTextField(
            controller: _setpasswordcontroller,
            hintText: "Choose your password",
            suffixIcon: Image.asset(AppAssets.password),
            // onChanged: (String? value) {
            //   stepperProvider.updatePassword(value ?? "");
            // },
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
      children: [
        GlobalText(
          'Where do you live,Thalia?',
          textStyle: textStyle20SemiBold.copyWith(
              color: AppColors.redcolor,
              fontSize: 30.sp,
              fontWeight: FontWeight.w600),
        ),
        110.h.verticalSpace,
        AppTextField(
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
          },
          text: "NEXT",
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              context.pushNamed(AppRoute.notifictionscreen.name);
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