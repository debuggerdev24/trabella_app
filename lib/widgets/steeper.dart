import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/provider/auth_provider.dart';
import 'package:travel_app/utils/app_colors.dart';

class Customstepper extends StatelessWidget {
  const Customstepper({super.key});

  @override
  Widget build(BuildContext context) {
    final stepperProvider = Provider.of<Authprovider>(context);
    return Row(
      children: List.generate(6, (index) {
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                stepperProvider.jumpToStep(index);
              },
              child: CircleAvatar(
                radius: 7.r,
                backgroundColor: stepperProvider.currentStep >= index
                    ? AppColors.darkredcolor
                    : AppColors.greycolor.withOpacity(0.5),
              ),
            ),
            if (index < 5)
              Container(
                width: 50.w,
                height: 5.r,
                color: stepperProvider.currentStep > index
                    ? AppColors.darkredcolor
                    : AppColors.dotsteeprcolor,
              ),
          ],
        );
      }),
    );
  }
}
