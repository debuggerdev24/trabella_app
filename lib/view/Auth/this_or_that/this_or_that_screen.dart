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

class ThisOrThatScreen extends StatelessWidget {
  const ThisOrThatScreen({super.key});

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
            const KBackButton(
              color: AppColors.backgroungcolor,
              iconcolor: AppColors.darkredcolor,
            ),
            250.h.verticalSpace,
            GlobalText(
              'Let’s play “This or That”',
              textStyle: textStyle16.copyWith(
                  color: AppColors.backgroungcolor,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w600),
            ),
            100.h.verticalSpace,
            AppButton(
              colorType: AppButtonColorType.secondary,
              onPressed: () {
                context.pushNamed(AppRoute.catordogscreen.name);
              },
              text: "LETS!",
            ),
            10.h.verticalSpace,
            Center(
              child: GlobalText(
                color: AppColors.backgroungcolor,
                'Maybe Later!',
                textStyle: textStyle18SemiBold.copyWith(
                    decorationColor: AppColors.backgroungcolor,
                    decoration: TextDecoration.underline,
                    color: AppColors.backgroungcolor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
