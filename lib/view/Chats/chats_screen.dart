import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/routes/route.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/widgets/app_txt_field.dart';
import 'package:travel_app/widgets/back_button.dart';
import 'package:travel_app/widgets/chat_items.dart';
import 'package:travel_app/widgets/top_bar.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawers(),
      backgroundColor: AppColors.backgroungcolor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.r),
            child: Column(
              children: [
                53.h.verticalSpace,
                Align(
                  alignment: Alignment.topLeft,
                  child: GlobalText(
                    'Chat',
                    textStyle: textStyle20SemiBold.copyWith(
                      color: AppColors.darkredcolor,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                20.h.verticalSpace,
                AppTextField(
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search....",
                  hintStyle: textStyle14.copyWith(
                    color: AppColors.greycolor,
                    fontSize: 18.sp,
                  ),
                  fillcolor: AppColors.backgroungcolor,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 40.r,
                    vertical: 20.h,
                  ),
                ),
                30.h.verticalSpace,
                ChatItem(
                  ontap: () {
                    context.pushNamed(AppRoute.chatmessagescreen.name);
                  },
                  imageUrl: AppAssets.myprofile2,
                  name: 'Elizabeth',
                  message: 'You: What are you doing? ',
                  time: '33 min ago',
                  isRead: true,
                ),
                const Divider(),
                ChatItem(
                  ontap: () {},
                  imageUrl: AppAssets.chatuser,
                  name: 'Victoria',
                  message: 'Hello',
                  time: '33 min ago',
                  isRead: false,
                  unreadCount: 2,
                ),
                const Divider(),
                ChatItem(
                  ontap: () {},
                  imageUrl: AppAssets.myprofile2,
                  name: 'Elizabeth',
                  message: 'You: What are you doing?',
                  time: '33 min ago',
                  isRead: true,
                ),
                const Divider(),
                ChatItem(
                  ontap: () {},
                  imageUrl: AppAssets.chatuser,
                  name: 'Emily',
                  message: 'Photo',
                  time: '33 min ago',
                  isRead: false,
                  unreadCount: 2,
                  isPhoto: true,
                ),
                const Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget Drawers() {
    return Drawer(
      backgroundColor: AppColors.darkredcolor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: AppColors.darkredcolor),
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: SvgIcon(
                  AppAssets.drawercancel,
                  color: AppColors.whiteColor,
                  size: 36.sp,
                ),
              ),
            ),
          ),
          ListTile(
            onTap: () {
              context.pushNamed(AppRoute.myprofilescreen.name);
            },
            title: const Text(
              "My Profile",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            leading: SvgIcon(
              AppAssets.myprofile,
              color: AppColors.whiteColor,
              size: 26,
            ),
          ),
          ListTile(
            onTap: () {},
            title: const Text(
              "Invite Friends",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            leading: SvgIcon(
              AppAssets.invitefriend,
              color: AppColors.whiteColor,
              size: 26,
            ),
          ),
          ListTile(
            onTap: () {
              context.pushNamed(AppRoute.settingscreen.name);
            },
            title: const Text(
              "Settings",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            leading: SvgIcon(
              AppAssets.setting,
              color: AppColors.whiteColor,
              size: 26,
            ),
          ),
          ListTile(
            onTap: () {},
            title: const Text(
              "Log out",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            leading: SvgIcon(
              AppAssets.logout,
              color: AppColors.whiteColor,
              size: 26,
            ),
          ),
        ],
      ),
    );
  }
}
