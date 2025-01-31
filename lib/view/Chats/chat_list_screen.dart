import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/routes/route.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/view/chats/chat_user_list.dart';
import 'package:travel_app/widgets/app_txt_field.dart';
import 'package:travel_app/widgets/back_button.dart';
import 'package:travel_app/widgets/chat_items.dart';
import 'package:travel_app/widgets/darwer_tile.dart';
import 'package:travel_app/widgets/top_bar.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatUsers> chatUsers = [
    ChatUsers(
      image: AppAssets.chatuser,
      text: 'Victoria',
      secondaryText: 'Hello',
      time: '33 min ago',
      isRead: false,
      unreadCount: 2,
    ),
    ChatUsers(
      text: "Glady's Murphy",
      secondaryText: "That's Great",
      image: AppAssets.myprofile2,
      time: "Yesterday",
      isRead: false,
      unreadCount: 2,
    ),
    ChatUsers(
      text: "Jorge Henry",
      secondaryText: "Hey where are you?",
      image: AppAssets.chatuser,
      time: "31 Mar",
      isRead: false,
      unreadCount: 2,
    ),
    ChatUsers(
      text: "Jorge Henry",
      secondaryText: "Hey where are you?",
      image: AppAssets.chatuser,
      time: "31 Mar",
      isRead: false,
      unreadCount: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: AppColors.backgroungcolor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.h.verticalSpace,
          const TopBar(),
          20.h.verticalSpace,
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                30.h.verticalSpace,
                GlobalText(
                  'Chat',
                  textStyle: textStyle20SemiBold.copyWith(
                    color: AppColors.darkredcolor,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                20.h.verticalSpace,
                AppTextField(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(13),
                    child: SvgIcon(
                      AppAssets.serch,
                      color: AppColors.textcolor,
                    ),
                  ),
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
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.r, vertical: 20.h),
              child: GestureDetector(
                onTap: () {
                  context.pushNamed(AppRoute.chatmessagescreen.name);
                },
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: chatUsers.length,
                  itemBuilder: (context, index) {
                    return ChatItem(
                      unreadCount: chatUsers[index].unreadCount,
                      name: chatUsers[index].text,
                      imageUrl: chatUsers[index].image,
                      time: chatUsers[index].time,
                      message: chatUsers[index].secondaryText,
                      isRead: (index == 0 || index == 4),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
