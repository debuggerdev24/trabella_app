import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/routes/route.dart';
import 'package:travel_app/utils/styles.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      width: 242.w,
      backgroundColor: AppColors.darkredcolor,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        children: [
          _buildDrawerHeader(context),
          _buildDrawerItem(
            context,
            iconPath: AppAssets.myprofile,
            title: "My Profile",
            onTap: () {
              context.pushNamed(AppRoute.myprofilescreen.name);
            },
          ),
          _buildDrawerItem(
            context,
            iconPath: AppAssets.invitefriend,
            title: "Invite Friends",
            onTap: () {},
          ),
          _buildDrawerItem(
            context,
            iconPath: AppAssets.setting,
            title: "Settings",
            onTap: () {
              context.pushNamed(AppRoute.settingscreen.name);
            },
          ),
          _buildDrawerItem(
            context,
            iconPath: AppAssets.logout,
            title: "Log Out",
            onTap: () {
              context.pushNamed(AppRoute.loginscreen.name);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(color: AppColors.darkredcolor),
      child: Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: SvgPicture.asset(
            AppAssets.drawercancel,
            color: AppColors.whiteColor,
            width: 36.sp,
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context,
      {required String iconPath,
      required String title,
      required Function() onTap}) {
    return ListTile(
      onTap: onTap,
      title: GlobalText(
        title,
        textStyle: textStyle18.copyWith(
            color: AppColors.backgroungcolor, fontWeight: FontWeight.w500),
      ),
      leading: SvgPicture.asset(
        iconPath,
        color: AppColors.whiteColor,
        width: 26.sp,
      ),
    );
  }
}
