import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/widgets/back_button.dart';

class ChatmessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroungcolor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 120.h, child: topbar()),
        ],
      ),
    );
  }

  Widget topbar() {
    return Container(
      padding: EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 10),
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
          30.w.horizontalSpace,
          Row(
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundImage: AssetImage(AppAssets.chatuser),
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
                      Icon(Icons.circle, color: Colors.green, size: 4),
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
}
