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
                  120.h.verticalSpace,
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: KBackButton(
                        color: AppColors.darkredcolor,
                        iconcolor: AppColors.backgroungcolor),
                  ),
                  30.h.verticalSpace,
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      "Settings",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
      title: Text(title),
      trailing: isSwitch
          ? Switch.adaptive(
              value: _notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
              activeColor: AppColors.darkredcolor,
            )
          : Icon(Icons.chevron_right),
    );
  }
}
