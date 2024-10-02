import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:travel_app/utils/routes/route.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/app_txt_field.dart';
import 'package:travel_app/widgets/back_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroungcolor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  100.h.verticalSpace,
                  const KBackButton(
                    color: AppColors.darkredcolor,
                    iconcolor: AppColors.backgroungcolor,
                  ),
                  60.h.verticalSpace,
                  GlobalText(
                    'We’ve emailed you a verification code',
                    textStyle: textStyle16Bold.copyWith(
                        color: AppColors.redcolor,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  146.h.verticalSpace,
                  _buildOtpInput(),
                  40.h.verticalSpace,
                  AppButton(
                    onPressed: () {
                      context.pushNamed(AppRoute.verifyscreen.name);
                    },
                    text: "SUBMIT",
                  ),
                  20.h.verticalSpace,
                  Center(
                    child: GlobalText(
                      color: AppColors.greycolor,
                      'Resend code',
                      textStyle: textStyle18SemiBold.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.textcolor.withOpacity(0.8),
                        color: AppColors.textcolor.withOpacity(0.8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpInput() {
    return Pinput(
      length: 6,
      onChanged: (value) {
        setState(() {});
      },
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      controller: _otpController,
      focusedPinTheme: PinTheme(
          height: 60.sp,
          width: 43.76.sp,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.h),
              border: const Border.fromBorderSide(
                  BorderSide(color: AppColors.darkredcolor))),
          textStyle: textStyle16.copyWith(
              color: AppColors.darkredcolor, fontSize: 20.sp)),
      defaultPinTheme: PinTheme(
          height: 60.sp,
          width: 43.76.sp,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.h),
              border: const Border.fromBorderSide(
                  BorderSide(color: AppColors.greycolor))),
          textStyle: textStyle16.copyWith(
              color: AppColors.darkredcolor, fontSize: 20.sp)),
    );
  }
}
