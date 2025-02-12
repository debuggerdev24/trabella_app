import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/routes/route.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/view/auth/take_photo_screen.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/back_button.dart';

class ImageviewsScreen extends StatelessWidget {
  final String imagePath;
  const ImageviewsScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroungcolor,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.sp,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    140.h.verticalSpace,
                    const KBackButton(
                      color: AppColors.darkredcolor,
                      iconcolor: AppColors.backgroungcolor,
                    ),
                    200.h.verticalSpace,
                    ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.file(
                          fit: BoxFit.fill,
                          File(imagePath),
                          width: double.infinity,
                          height: 260.h,
                        )),

                    // SizedBox(
                    //     height: 300.h,
                    //     width: double.infinity,
                    //     child: Image.file(File(imagePath))),
                    70.h.verticalSpace,
                    AppButton(
                      onPressed: () {
                        context.pushNamed(AppRoute.selfiescren.name);
                      },
                      text: "SUBMIT",
                    ),
                    15.h.verticalSpace,
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(AppRoute.takephotoscreen.name);
                      },
                      child: Center(
                          child: GlobalText(
                        color: AppColors.greycolor,
                        'Retake',
                        textStyle: textStyle18SemiBold.copyWith(
                          decorationColor: AppColors.textcolor.withOpacity(0.8),
                          decoration: TextDecoration.underline,
                          color: AppColors.textcolor.withOpacity(0.8),
                        ),
                      )),
                    )
                  ],
                ),
              ),
            ]));
  }
}
