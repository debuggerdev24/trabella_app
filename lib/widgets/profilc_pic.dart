import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic(
      {super.key,
      required this.image,
      required this.icon,
      this.isVerified = false,
      this.file});

  final String image;
  final File? file;
  final Widget icon;
  final bool isVerified;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: 130,
      child: Stack(
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
              height: 120,
              width: 200,
              margin: EdgeInsets.symmetric(horizontal: 12.h),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage(image)),
              ),
            ),
          if (icon != null)
            Positioned(bottom: 0, right: 25, top: 70, child: icon)
        ],
      ),
    );
  }
}
