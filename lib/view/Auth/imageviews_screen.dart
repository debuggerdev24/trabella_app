import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/routes/route.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/view/Auth/verifiaction_screen.dart';
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
                    100.h.verticalSpace,
                    SizedBox(
                        height: 450.h,
                        width: double.infinity,
                        child: Image.file(File(imagePath))),
                    100.h.verticalSpace,
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