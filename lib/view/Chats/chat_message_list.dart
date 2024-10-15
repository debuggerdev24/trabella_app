// lib/view/Chats/chat_message_screen.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/provider/chat_provider.dart';

import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/widgets/app_txt_field.dart';
import 'package:travel_app/widgets/back_button.dart';

class ChatmessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroungcolor,
      body: Column(
        children: [
          topbar(context),
          20.h.verticalSpace,
          GlobalText(
            "Today",
            textStyle: textStyle16.copyWith(
              color: AppColors.textcolor,
              fontSize: 18.sp,
            ),
          ),
          Expanded(
            child: Consumer<ChatProvider>(
              builder: (context, chatProvider, child) {
                return ListView.builder(
                  itemCount: chatProvider.messages.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final message = chatProvider.messages[index];
                    return Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 10.h),
                      child: Align(
                        alignment: message.messageType == "receiver"
                            ? Alignment.topLeft
                            : Alignment.topRight,
                        child: Column(
                          crossAxisAlignment: message.messageType == "receiver"
                              ? CrossAxisAlignment.start
                              : CrossAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: message.messageType == "receiver"
                                    ? BorderRadius.only(
                                        topLeft: Radius.circular(15.r),
                                        topRight: Radius.circular(15.r),
                                        bottomRight: Radius.circular(15.r))
                                    : BorderRadius.only(
                                        topLeft: Radius.circular(15.r),
                                        topRight: Radius.circular(15.r),
                                        bottomLeft: Radius.circular(15.r)),
                                color: message.messageType == "receiver"
                                    ? AppColors.textcolor
                                    : AppColors.whiteColor,
                              ),
                              padding: EdgeInsets.all(16),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: 250.w,
                                ),
                                child: GlobalText(
                                  message.messageContent,
                                  textStyle: textStyle18.copyWith(
                                    color: message.messageType == "receiver"
                                        ? AppColors.whiteColor
                                        : AppColors.textcolor,
                                    fontSize: chatProvider.currentFontSize,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Align(
                                alignment: message.messageType == "receiver"
                                    ? Alignment.topLeft
                                    : Alignment.topRight,
                                child: GlobalText(
                                  message.time,
                                  textStyle: textStyle18.copyWith(
                                    color: AppColors.textcolor,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          messageInput(context),
        ],
      ),
    );
  }

  Widget topbar(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 50.h, left: 16.w, right: 16.w, bottom: 10.h),
      decoration: BoxDecoration(
        color: Color(0xFFF5F0E3),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          20.w.horizontalSpace,
          const KBackButton(
              color: AppColors.darkredcolor,
              iconcolor: AppColors.backgroungcolor),
          20.w.horizontalSpace,
          Row(
            children: [
              CircleAvatar(
                radius: 25.r,
                backgroundImage: const AssetImage(AppAssets.chatuser),
              ),
              10.w.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.w.horizontalSpace,
                  const Text(
                    'Thalia',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const Row(
                    children: [
                      Icon(Icons.circle, color: Colors.green, size: 10),
                      SizedBox(width: 4),
                      Text(
                        'Online',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textcolor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Row(
            children: [
              SvgIcon(
                AppAssets.phone,
                color: AppColors.darkredcolor,
              ),
              20.w.horizontalSpace,
              SvgIcon(
                AppAssets.videocall,
                color: AppColors.darkredcolor,
              ),
              20.w.horizontalSpace,
            ],
          ),
        ],
      ),
    );
  }

  Widget messageInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
      child: Row(
        children: [
          Expanded(
            child: Consumer<ChatProvider>(
              builder: (context, chatProvider, child) {
                return AppTextField(
                  hintText: 'Write message...',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  fillcolor: Colors.white,
                  border: InputBorder.none,
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(12.r),
                    child: const SvgIcon(
                      AppAssets.share,
                      color: AppColors.greycolor,
                    ),
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(10.r),
                    child: const SvgIcon(
                      AppAssets.microphone,
                      color: AppColors.greycolor,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(width: 10.w),
          Container(
            width: 50.w,
            height: 50.h,
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: AppColors.darkredcolor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: GestureDetector(
              onTap: () {
                Provider.of<ChatProvider>(context, listen: false)
                    .increaseFontSize();
              },
              child: SvgIcon(
                AppAssets.fontbig,
                color: AppColors.whiteColor,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Container(
            width: 50.w,
            height: 50.h,
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: AppColors.darkredcolor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: GestureDetector(
              onTap: () {
                // Decrease font size using provider
                Provider.of<ChatProvider>(context, listen: false)
                    .decreaseFontSize();
              },
              child: SvgIcon(
                AppAssets.fontsmall,
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
