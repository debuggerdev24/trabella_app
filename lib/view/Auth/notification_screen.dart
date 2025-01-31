import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/routes/route.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/back_button.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  PermissionStatus _permissionStatus = PermissionStatus.denied;

  @override
  void initState() {
    super.initState();
    // Check the current notification permission status on init
    checkNotificationPermission();
  }

  // Function to check the current notification permission status
  void checkNotificationPermission() async {
    PermissionStatus status = await Permission.notification.status;
    setState(() {
      _permissionStatus = status;
    });
  }

  // Function to request notification permission
  void requestNotificationPermission() async {
    // Request notification permission
    PermissionStatus status = await Permission.notification.request();

    // Update the permission status in the UI
    setState(() {
      _permissionStatus = status;
    });

    // If permission is granted, navigate to the ID verification screen
    if (_permissionStatus.isGranted) {
      context.pushNamed(AppRoute.idverificationscreen.name);
    } else {
      // Optionally, handle the case when permission is denied or permanently denied
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Notification permission is required to proceed."),
        ),
      );
    }
  }

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
                150.h.verticalSpace,
                const KBackButton(
                  color: AppColors.darkredcolor,
                  iconcolor: AppColors.backgroungcolor,
                ),
                70.h.verticalSpace,
                RichText(
                  text: TextSpan(
                    text: 'We’ll let you know\nwhen you have\n',
                    style: textstyle30semiBold.copyWith(
                      color: AppColors.redcolor,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Trabellas',
                        style: textstyle30semiBold.copyWith(
                            color: AppColors.redcolor,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic),
                      ),
                      TextSpan(
                        text: ' near you.',
                        style: textstyle30semiBold.copyWith(
                          color: AppColors.redcolor,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                100.h.verticalSpace,
                AppButton(
                  onPressed: () {
                    // requestNotificationPermission();
                    context.pushNamed(AppRoute.idverificationscreen.name);
                  },
                  text: "ALLOW NOTIFICATIONS",
                ),
                10.h.verticalSpace,
                GestureDetector(
                  onTap: () {
                    context.pushNamed(AppRoute.idverificationscreen.name);
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
            ),
          ),
        ],
      ),
    );
  }
}
