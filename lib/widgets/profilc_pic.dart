import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic(
      {super.key, required this.image, this.isVerified = false, this.file});

  final String image;
  final File? file;
  final bool isVerified;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      width: 130.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          if (file != null)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.h),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                image:
                    DecorationImage(image: FileImage(file!), fit: BoxFit.cover),
              ),
            ),
          if (file == null)
            Container(
              height: 120.h,
              width: 220.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover),
              ),
            ),
          Positioned(
            bottom: 0,
            right: -10.r,
            child: CircleAvatar(
              backgroundColor: AppColors.darkredcolor,
              radius: 22.0.r,
              child: Icon(Icons.edit_outlined, color: Colors.white, size: 25.0),
            ),
          ),
        ],
      ),
    );
  }
}
