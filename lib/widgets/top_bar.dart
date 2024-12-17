import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:travel_app/utils/app_assets.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 40.w,
        left: 40.w,
        top: 70.h,
      ),
      child: Row(
        children: [
          Builder(
            builder: (context) {
              return GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: SvgPicture.asset(
                  AppAssets.message,
                  width: 46.w,
                ),
              );
            },
          ),
          const Spacer(),
          SvgPicture.asset(
            AppAssets.notification,
            width: 46.w,
          ),
        ],
      ),
    );
  }
}
