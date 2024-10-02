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

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkredcolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            120.h.verticalSpace,
            KBackButton(
              color: AppColors.backgroungcolor,
              iconcolor: AppColors.darkredcolor,
            ),
            60.h.verticalSpace,
            GlobalText(
              'Thank you, we’ve verified your email!',
              textStyle: textStyle14SemiBold.copyWith(
                  color: AppColors.backgroungcolor,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w600),
            ),
            148.h.verticalSpace,
            AppButton(
              colorType: AppButtonColorType.secondary,
              onPressed: () {
                context.pushNamed(AppRoute.setpasswordscreen.name);
              },
              text: "CONTINUE",
            ),
          ],
        ),
      ),
    );
  }
}