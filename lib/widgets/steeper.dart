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

class Customstepper1 extends StatelessWidget {
  final int stepCount;
  const Customstepper1({super.key, required this.stepCount});

  @override
  Widget build(BuildContext context) {
    final stepperProvider = Provider.of<Authprovider>(context);
    return Row(
      children: List.generate(stepCount, (index) {
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                stepperProvider.jumpToStep(index);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: stepCount == 5 ? 15.r : 14.r,
                height: 15.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: stepperProvider.currentStep >= index
                      ? AppColors.darkredcolor
                      : AppColors.greycolor.withOpacity(0.5),
                ),
              ),
            ),
            if (index < stepCount - 1)
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: stepCount == 5 ? 63.w : 53.w,
                height: 4.5.r,
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
