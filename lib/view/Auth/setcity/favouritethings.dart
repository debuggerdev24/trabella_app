import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/provider/auth_provider.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/routes/route.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/view/Auth/take_photo_screen.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/destination_chip.dart';

class Favouritethings extends StatefulWidget {
  Favouritethings({super.key});

  @override
  State<Favouritethings> createState() => _FavouritethingsState();
}

class _FavouritethingsState extends State<Favouritethings> {
  Set<String> selectedDestinations = {};
  get stepperProvider => null;

  final List<String> hobbies = [
    "HIKING",
    "BAKING",
    "GARDENING",
    "YOGA",
    "MOVIES",
    "FESTIVALS",
    "GALLERIES",
    "FOODIE",
    "GARDENING",
    "DIVING",
    "CAMPING",
    "MUSIC",
  ];

  @override
  Widget build(BuildContext context) {
    final stepperProvider = Provider.of<Authprovider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GlobalText(
          'Choose 5 things you’re really into',
          textStyle: textStyle20SemiBold.copyWith(
            color: AppColors.redcolor,
          ),
        ),
        30.h.verticalSpace,
        Wrap(
          alignment: WrapAlignment.center,
          children: hobbies.map((hobbies) {
            bool isSelected = selectedDestinations.contains(hobbies);
            return AppChip(
              text: hobbies,
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  if (isSelected) {
                    selectedDestinations.remove(hobbies);
                  } else {
                    selectedDestinations.add(hobbies);
                  }
                });
              },
            );
          }).toList(),
        ),
        40.h.verticalSpace,
        AppButton(
          onPressed: () {
            context.pushNamed(AppRoute.thisorthatscreen.name);
          },
          text: "NEXT",
        ),
        20.h.verticalSpace,
        GestureDetector(
          onTap: () {
            stepperProvider.nextStep();
          },
          child: Center(
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
    );
  }
}

class Holidaydestination extends StatefulWidget {
  const Holidaydestination({super.key});

  @override
  _HolidaydestinationState createState() => _HolidaydestinationState();
}

class _HolidaydestinationState extends State<Holidaydestination> {
  Set<String> selectedDestinations = {};

  final List<String> destinations = [
    "MELBOURNE",
    "NEW YORK",
    "BUENOS AIRES",
    "BALI",
    "TOKYO",
    "COPENHAGEN",
    "LONDON",
    "BEIJING",
    "HO CHI MINH",
    "PARIS",
    "BERLIN",
    "MACHU PICHHU",
  ];

  @override
  Widget build(BuildContext context) {
    final stepperProvider = Provider.of<Authprovider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GlobalText(
          'Choose top 5 holiday destinations',
          textStyle: textStyle20SemiBold.copyWith(
              color: AppColors.redcolor,
              fontSize: 30.sp,
              fontWeight: FontWeight.w600),
        ),
        30.h.verticalSpace,
        Wrap(
          children: destinations.map((destination) {
            bool isSelected = selectedDestinations.contains(destination);
            return AppChip(
              text: destination,
              isSelected: isSelected,
              onTap: () {
                setState(() {
                  if (isSelected) {
                    selectedDestinations.remove(destination);
                  } else {
                    selectedDestinations.add(destination);
                  }
                });
              },
            );
          }).toList(),
        ),
        40.h.verticalSpace,
        AppButton(
          onPressed: () {
            stepperProvider.nextStep();
          },
          text: "NEXT",
        ),
        20.h.verticalSpace,
        Center(
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
      ],
    );
  }
}
