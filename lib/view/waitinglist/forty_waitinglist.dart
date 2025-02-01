import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:pinput/pinput.dart';
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
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _aboutyou = TextEditingController();
  TextEditingController _travelcontroller = TextEditingController();

  int _currentLength = 0;
  int _aboutLength = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeProvider>().changeSelectedCountry(null);
      _travelcontroller.addListener(updatelength);
      _aboutyou.addListener(updateabout);
    });
  }

  @override
  void dispose() {
    _travelcontroller.removeListener(updatelength);
    _aboutyou.removeListener(updateabout);
    _travelcontroller.dispose();
    _aboutyou.dispose();
    super.dispose();
  }

  void updatelength() {
    setState(() {
      _currentLength = _travelcontroller.length;
     
    });
  }

    void updateabout() {
    setState(() {
      _aboutLength = _aboutyou.length;
     
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
                76.h.verticalSpace,
                AppTextField(
                  controller: _emailcontroller,
                  fillcolor: Colors.transparent,
                  labelText: "Email",
                  labelStyle:
                      textStyle18SemiBold.copyWith(color: AppColors.blackColor),
                  hintText: "trabella@travvel.com",
                ),
                20.h.verticalSpace,
                GestureDetector(
                  onTap: () {
                    
                  },
                  child: AppTextField(
                    controller: _dateController,
                    fillcolor: Colors.transparent,
                    labelText: "Date of Birth",
                    readOnly: true,
                    style: TextStyle(color: AppColors.textcolor),
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
                        padding: EdgeInsets.all(16.sp),
                        child: Image.asset(
                          AppAssets.birthTime,
                          height: 12.sp,
                        ),
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
                      dropdownIcon: AppAssets.down,
                      hintText: "Country",
                      // value: homeProvider.selectedcountry,
                      onChanged: (value) {
                        homeProvider.changeSelectedCountry(value);
                      },
                      dropDownList: countrydropdownlist(),
                    )),
                20.h.verticalSpace,
                AppTextField(
                  controller: _travelcontroller,
                  fillcolor: Colors.transparent,
                  // maxLength: 200,
                  labelText: "About you",
                  labelStyle:
                      textStyle18SemiBold.copyWith(color: AppColors.blackColor),
                  hintText: "Tell us about yourself...",
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GlobalText("$_currentLength/200"),
                ),
                20.h.verticalSpace,
                AppTextField(
                  controller: _aboutyou,
                  fillcolor: Colors.transparent,
                   labelRichText: RichText(
            text: TextSpan(
              text: 'Trabella',
              style: TextStyle(
                fontSize: 18.sp,
                color: AppColors.greycolor,
                fontStyle: FontStyle.italic,
               fontWeight: FontWeight.w600,
                             
              ),
              children: [
                TextSpan(
                  text: ' is for you because...',
                  style: TextStyle(
                
                    fontSize: 18.sp,
                    fontStyle: FontStyle.normal,
                     fontWeight: FontWeight.w600,
                              color:AppColors.greycolor
                  ),
                ),
              ],
            ),
          ),
                 
                  labelStyle:
                      textStyle18SemiBold.copyWith(color: AppColors.blackColor),
                  hintText: "How do you like to travel...",
                  
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: GlobalText("$_aboutLength/200")),
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
