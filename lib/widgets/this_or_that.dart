import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/provider/auth_provider.dart';
import 'package:travel_app/tabs/tabs.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/routes/route.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/widgets/app_button.dart';

class ThisOrThat extends StatelessWidget {
  const ThisOrThat(
      {super.key,
      required this.thisimage,
      required this.thatimage,
      required this.text,
      required this.pagecontroller,
      required this.onpressed,
      required this.ontap});
  final String thisimage;
  final String thatimage;
  final String text;
  final PageController pagecontroller;
  final VoidCallback onpressed;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalText(
            text,
            textStyle: textStyle20SemiBold.copyWith(
              color: AppColors.redcolor,
            ),
          ),
          20.h.verticalSpace,
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 10.h,
            crossAxisSpacing: 16.w,
            children: [
              GestureDetector(
                onTap: () {},
                child: Image.asset(
                  thisimage,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Image.asset(thatimage),
              ),
            ],
          ),
          70.h.verticalSpace,
          AppButton(onPressed: ontap, text: "NEXT"),
          20.h.verticalSpace,
          Center(
            child: GestureDetector(
              onTap: ontap,
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
