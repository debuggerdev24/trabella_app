import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/styles.dart';

class ChatItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String message;
  final String time;
  final bool isRead;
  final int unreadCount;
  final bool isPhoto;

  ChatItem({
    required this.imageUrl,
    required this.name,
    required this.message,
    required this.time,
    required this.isRead,
    this.unreadCount = 0,
    this.isPhoto = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        children: [
          CircleAvatar(
            radius: 27.r,
            backgroundImage: AssetImage(imageUrl),
          ),
          10.w.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlobalText(
                  name,
                  textStyle: textStyle14.copyWith(
                      color: AppColors.textcolor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
                GlobalText(
                  maxLine: 1,
                  message,
                  textStyle: textStyle14.copyWith(
                      color: AppColors.greycolor, fontSize: 16.sp),
                ),
              ],
            ),
          ),
          10.w.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GlobalText(
                time,
                textStyle: textStyle14.copyWith(
                  color: AppColors.greycolor,
                ),
              ),
              if (isRead)
                SvgIcon(
                  AppAssets.read,
                  size: 12.w,
                ),
              if (!isRead)
                Container(
                  width: 20.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    color: AppColors.darkredcolor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  alignment: Alignment.center,
                  child: GlobalText(
                    '$unreadCount',
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(color: Colors.white, fontSize: 12.sp),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
