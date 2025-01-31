import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/routes/route.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/app_txt_field.dart';
import 'package:travel_app/widgets/back_button.dart';

class FeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _feedbackcontroller = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.darkredcolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              40.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const KBackButton(
                      color: AppColors.backgroungcolor,
                      iconcolor: AppColors.darkredcolor),
                  Spacer(),
                  SvgPicture.asset(
                    AppAssets.appicon,
                    height: 125.h,
                  ),
                ],
              ),
              100.h.verticalSpace,
              GlobalText(
                "Share feedback",
                textStyle: textStyle18SemiBold.copyWith(
                    color: AppColors.backgroungcolor,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w600),
              ),
              15.h.verticalSpace,
              GlobalText(
                "Your feedback and ideas are incredibly valuable to us, please leave your comment below:",
                textStyle: textStyle18.copyWith(
                    color: AppColors.backgroungcolor, fontSize: 19.5.sp),
              ),
              30.h.verticalSpace,
              AppTextField(
                controller: _feedbackcontroller,
                hintText: "Type here...",
                maxLines: 3,
                fillcolor: AppColors.backgroungcolor,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
              ),
              50.verticalSpace,
              AppButton(
                  colorType: AppButtonColorType.secondary,
                  onPressed: () {
                    context.pushNamed(AppRoute.feedbackverification.name);
                  },
                  text: "SEND")
            ],
          ),
        ),
      ),
    );
  }
}
