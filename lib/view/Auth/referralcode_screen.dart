import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/utils/routes/route.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/app_txt_field.dart';
import 'package:travel_app/widgets/back_button.dart';
import 'package:travel_app/widgets/waitinglist.dart';

class ReferralCodeScreern extends StatefulWidget {
  const ReferralCodeScreern({super.key});

  @override
  State<ReferralCodeScreern> createState() => _ReferralCodeScreernState();
}

class _ReferralCodeScreernState extends State<ReferralCodeScreern> {
  final TextEditingController _referralcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroungcolor,
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  150.h.verticalSpace,
                  const KBackButton(
                    color: AppColors.darkredcolor,
                    iconcolor: AppColors.backgroungcolor,
                  ),
                  70.h.verticalSpace,
                  GlobalText(
                    'Enter your referral code',
                    textStyle: textstyle30semiBold.copyWith(
                      color: AppColors.redcolor,
                    ),
                  ),
                  150.h.verticalSpace,
                  AppTextField(
                    fillcolor: Colors.transparent,
                    controller: _referralcontroller,
                    hintText: "Enter your 6 digit code here",
                  ),
                  50.h.verticalSpace,
                  AppButton(
                    onPressed: () {
                      context.pushNamed(AppRoute.emailscreen.name);
                    },
                    text: "SUBMIT",
                  ),
                  95.h.verticalSpace,
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.r),
              decoration: const BoxDecoration(
                color: AppColors.darkredcolor,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  20.h.verticalSpace,
                  GlobalText('Don’t have the code?',
                      textStyle: textStyle18SemiBold.copyWith(
                          color: AppColors.backgroungcolor, fontSize: 24.sp)),
                  40.h.verticalSpace,
                  AppButton(
                      colorType: AppButtonColorType.secondary,
                      onPressed: () {
                        context.pushNamed(AppRoute.fortywaitinglistscreen.name);
                      },
                      text: 'JOIN OUR WATING LIST',
                      textStyle:
                          const TextStyle(color: AppColors.darkredcolor)),
                ],
              ),
            ),
          )
        ]));
  }
}
