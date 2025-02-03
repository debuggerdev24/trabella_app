import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/tabs/tabs.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/routes/route.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/back_button.dart';
import 'package:travel_app/widgets/waitinglist.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _notificationsEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroungcolor,
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  130.h.verticalSpace,
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: KBackButton(
                        color: AppColors.darkredcolor,
                        iconcolor: AppColors.backgroungcolor),
                  ),
                  30.h.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: GlobalText("Settings",
                        textStyle: textStyle20SemiBold.copyWith(
                            color: AppColors.darkredcolor)),
                  ),
                  30.h.verticalSpace,
                  _buildSettingsOption("Account management"),
                  _buildSettingsOption("Notifications", isSwitch: true),
                  _buildSettingsOption("Help"),
                  _buildSettingsOption("Security and privacy"),
                ],
              ),
            ),
          ),
          Waitinglist(
              onpressed: () {
                context.pushNamed(AppRoute.feedbackscreen.name);
              },
              title: "Please help us improve",
              subtitle: "We’d appreciate any feedback you have.",
              text: "FEEDBACK")
        ],
      ),
    );
  }

  Widget _buildSettingsOption(String title, {bool isSwitch = false}) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      minTileHeight: 46.sp,
      title: GlobalText(
        title,
        textStyle: textStyle18SemiBold,
        fontSize: 20.sp,
      ),
      trailing: isSwitch
          ? Transform.scale(
              scaleX: 0.8,
              scaleY: 0.8,
              child: Switch(
                
                // applyCupertinoTheme: true,
                inactiveTrackColor: AppColors.blackColor,
                inactiveThumbColor: AppColors.redcolor,
                trackOutlineWidth: MaterialStateProperty.all(0),
                value: _notificationsEnabled,
                onChanged: (bool value) {
                  setState(() {
                    _notificationsEnabled = value;
                  });
                },
                activeColor: AppColors.darkredcolor,
              ),
            )
          : Icon(
              Icons.chevron_right,
              size: 34.sp,
            ),
    );
  }
}
