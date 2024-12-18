import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/provider/auth_provider.dart';
import 'package:travel_app/provider/home_provider.dart';
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

class FortyWaitinglistSCreen extends StatefulWidget {
  const FortyWaitinglistSCreen({super.key});

  @override
  State<FortyWaitinglistSCreen> createState() => _FortyWaitinglistSCreenState();
}

class _FortyWaitinglistSCreenState extends State<FortyWaitinglistSCreen> {
  List<TextEditingController> _controllers = [];
  TextEditingController _dateController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeProvider>().changeSelectedCountry(null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<Authprovider, HomeProvider>(
        builder: (context, authProvider, homeProvider, _) {
      return Scaffold(
          backgroundColor: AppColors.backgroungcolor,
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                100.h.verticalSpace,
                const KBackButton(
                  color: AppColors.darkredcolor,
                  iconcolor: AppColors.backgroungcolor,
                ),
                60.h.verticalSpace,
                GlobalText(
                  'Not forty yet? \nJoin our waiting list',
                  textStyle: textStyle20SemiBold.copyWith(
                    color: AppColors.redcolor,
                    fontSize: 30.sp,
                  ),
                ),
                20.h.verticalSpace,
                AppTextField(
                  fillcolor: Colors.transparent,
                  labelText: "Email",
                  labelStyle:
                      textStyle18SemiBold.copyWith(color: AppColors.blackColor),
                  hintText: "trabella@travvel.com",
                ),
                20.h.verticalSpace,
                AppTextField(
                  controller: _dateController,
                  fillcolor: Colors.transparent,
                  labelText: "Date of Birth",
                  readOnly: true,
                  style: TextStyle(color: AppColors.textcolor),
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
                          setState(() {
                            _dateController.text =
                                "${value.toLocal()}".split(' ')[0];
                          });
                        },
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.all(12.sp),
                      child: Image.asset(
                        AppAssets.birthTime,
                        height: 12.sp,
                      ),
                    ),
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
                      dropDownList: countrydropdownlist(),
                    )),
                20.h.verticalSpace,
                AppTextField(
                  fillcolor: Colors.transparent,
                  maxLength: 200,
                  labelText: "About you",
                  labelStyle:
                      textStyle18SemiBold.copyWith(color: AppColors.blackColor),
                  hintText: "Tell us about yourself...",
                ),
                20.h.verticalSpace,
                AppTextField(
                  fillcolor: Colors.transparent,
                  maxLength: 200,
                  labelText: "Trabella is for you because...",
                  labelStyle:
                      textStyle18SemiBold.copyWith(color: AppColors.blackColor),
                  hintText: "How do you like to travel...",
                ),
                20.h.verticalSpace,
                AppButton(
                    onPressed: () {
                      context.pushNamed(AppRoute.endofverificationscreen.name);
                    },
                    text: "SUBMIT"),
                20.h.verticalSpace
              ],
            ),
          )));
    });
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
