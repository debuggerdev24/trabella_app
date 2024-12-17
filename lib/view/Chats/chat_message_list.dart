// lib/view/Chats/chat_message_screen.dart

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/provider/chat_provider.dart';

import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/widgets/app_txt_field.dart';
import 'package:travel_app/widgets/back_button.dart';

class ChatmessageScreen extends StatefulWidget {
  @override
  State<ChatmessageScreen> createState() => _ChatmessageScreenState();
}

class _ChatmessageScreenState extends State<ChatmessageScreen> {
  bool showSendButton = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(builder: (context, chatProvider, child) {
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
              child: ListView.builder(
                itemCount: chatProvider.messages.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final message = chatProvider.messages[index];
                  return Container(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            message.messageType == "receiver" ? 30.w : 30.w,
                        vertical: 10.h),
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
                              child: message.messageContent == "thumb_up"
                                  ? Icon(
                                      Icons.thumb_up,
                                      size: 30.sp,
                                      color: AppColors.redcolor,
                                    )
                                  : GlobalText(
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
                            padding: EdgeInsets.only(top: 8.sp),
                            child: Align(
                              alignment: message.messageType == "receiver"
                                  ? Alignment.topLeft
                                  : Alignment.topRight,
                              child: Row(
                                mainAxisAlignment:
                                    message.messageType == "receiver"
                                        ? MainAxisAlignment.start
                                        : MainAxisAlignment.end,
                                children: [
                                  GlobalText(
                                    message.time,
                                    textStyle: textStyle18.copyWith(
                                      color:
                                          AppColors.textcolor.withOpacity(0.8),
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                  10.w.horizontalSpace,
                                  message.messageType == "receiver"
                                      ? SizedBox.shrink()
                                      : SvgIcon(
                                          AppAssets.doubleCheck,
                                          color: AppColors.redcolor,
                                          size: 13.sp,
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 50.w,
                    height: 50.h,
                    margin: EdgeInsets.only(right: 8.r, top: 10.r),
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
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.only(right: 30.r, top: 10.r),
                    padding: EdgeInsets.all(10.r),
                    width: 50.w,
                    height: 50.h,
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
                ),
              ],
            ),
            messageInput(context),
          ],
        ),
      );
    });
  }

  Widget topbar(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 70.h, left: 16.w, right: 16.w, bottom: 10.h),
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
                size: 26.sp,
              ),
              20.w.horizontalSpace,
              SvgIcon(
                AppAssets.videocall,
                color: AppColors.darkredcolor,
                size: 22.sp,
              ),
              20.w.horizontalSpace,
            ],
          ),
        ],
      ),
    );
  }

  Widget messageInput(BuildContext context) {
    return Consumer<ChatProvider>(builder: (context, chatProvider, child) {
      return Padding(
        padding:
            EdgeInsets.only(left: 15.w, top: 10.h, bottom: 10.h, right: 20.w),
        child: Row(
          children: [
            if (chatProvider.isMediaActive)
              Row(
                children: [
                  Icon(
                    Icons.camera_alt_rounded,
                    color: AppColors.redcolor,
                    size: 35.h,
                  ),
                  8.w.horizontalSpace,
                  Icon(
                    Icons.photo,
                    color: AppColors.redcolor,
                    size: 35.h,
                  ),
                  8.w.horizontalSpace,
                  Icon(
                    Icons.mic,
                    color: AppColors.redcolor,
                    size: 35.h,
                  ),
                ],
              ),
            5.w.horizontalSpace,
            GestureDetector(
              onTap: () {
                chatProvider.setMedia(!chatProvider.isMediaActive);
              },
              child: chatProvider.isMediaActive
                  ? Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.redcolor,
                      size: 30.h,
                    )
                  : Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.redcolor,
                      size: 30.h,
                    ),
            ),
            5.w.horizontalSpace,
            Expanded(
              child: Consumer<ChatProvider>(
                builder: (context, chatProvider, child) {
                  return AppTextField(
                      hintText: 'Write message...',
                      hintStyle: textStyle18.copyWith(
                          color: AppColors.textcolor,
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.start,
                      controller:
                          Provider.of<ChatProvider>(context).messageController,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      fillcolor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: chatProvider.isMessageControllerActive
                          ? GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.all(12.r),
                                child: const Icon(
                                  Icons.emoji_emotions,
                                  color: AppColors.redcolor,
                                ),
                              ),
                            )
                          : const SizedBox());
                },
              ),
            ),
            if (chatProvider.isMessageControllerActive)
              IconButton(
                onPressed: () {
                  DateTime now = DateTime.now();

                  // Format the time to "hh:mm a" format (e.g., "02:25 PM")
                  String formattedTime = DateFormat('hh:mm a').format(now);
                  chatProvider.addMessage(ChatMessage(
                      messageContent: chatProvider.messageController.text,
                      messageType: "sender",
                      time: formattedTime));
                  chatProvider.messageController.clear();
                  chatProvider.setMedia(false);
                },
                icon: Icon(
                  Icons.send,
                  size: 30.sp,
                  color: AppColors.redcolor,
                ),
                padding: EdgeInsets.all(0),
              ),
            5.w.horizontalSpace,
            if (chatProvider.isMediaActive)
              IconButton(
                onPressed: () {
                  DateTime now = DateTime.now();

                  String formattedTime = DateFormat('hh:mm a').format(now);
                  chatProvider.addMessage(ChatMessage(
                      messageContent: "thumb_up",
                      messageType: "sender",
                      time: formattedTime));
                  chatProvider.messageController.clear();
                  chatProvider.setMedia(false);
                },
                icon: Icon(
                  Icons.thumb_up,
                  size: 30.sp,
                  color: AppColors.redcolor,
                ),
                padding: EdgeInsets.all(0),
              ),
          ],
        ),
      );
    });
  }
}
