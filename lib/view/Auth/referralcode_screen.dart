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
                  100.h.verticalSpace,
                  const KBackButton(
                    color: AppColors.darkredcolor,
                    iconcolor: AppColors.backgroungcolor,
                  ),
                  50.h.verticalSpace,
                  GlobalText(
                    'Enter your referral code',
                    textStyle: textStyle20SemiBold.copyWith(
                        color: AppColors.redcolor, fontWeight: FontWeight.w600),
                  ),
                  100.h.verticalSpace,
                  AppTextField(
                    fillcolor: Colors.transparent,
                    controller: _referralcontroller,
                    hintText: "Enter your 6 digit code here",
                  ),
                  100.h.verticalSpace,
                  AppButton(
                    onPressed: () {
                      context.pushNamed(AppRoute.emailscreen.name);
                    },
                    text: "SUBMIT",
                  ),
                  120.h.verticalSpace,
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Waitinglist(
              title: "Don’t have the code?",
              subtitle: "",
              text: "JOIN OUR WATING LIST ",
              onpressed: () {
                context.pushNamed(AppRoute.fortywaitinglistscreen.name);
              },
            ),
          )
        ]));
  }
}
