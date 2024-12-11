import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/utils/routes/route.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/widgets/app_button.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            AppAssets.welcome,
            fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 27.w),
                child: GlobalText(
                  'Before we go ahead...\nTrabella is for women over 40 years old only.',
                  textAlign: TextAlign.center,
                  textStyle: textStyle14SemiBold.copyWith(
                      color: AppColors.backgroungcolor, fontSize: 30.sp),
                ),
              ),
              const Spacer(),
              AppButton(
                onPressed: () {
                  context.pushNamed(AppRoute.onbordingscreen.name);
                },
                text: "YES, I’D LOVE TO JOIN TRABELLA!",
              ),
              40.h.verticalSpace,
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      focusColor: AppColors.backgroungcolor,
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                      activeColor: AppColors.darkredcolor,
                      side: MaterialStateBorderSide.resolveWith(
                        (Set<MaterialState> states) {
                          if (!states.contains(MaterialState.selected)) {
                            return BorderSide(
                                width: 1.w,
                                color: AppColors
                                    .backgroungcolor); // Border when unchecked
                          }
                        },
                      ),
                    ),
                    Text(
                      'Terms and conditions and privacy policy.',
                      style: textStyle16.copyWith(
                          color: AppColors.backgroungcolor, fontSize: 16.sp),
                    ),
                  ],
                ),
              ),
              5.h.verticalSpace
            ],
          ),
        ],
      ),
    );
  }
}
