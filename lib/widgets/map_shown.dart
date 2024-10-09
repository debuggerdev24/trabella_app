import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:travel_app/utils/app_assets.dart';

import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/widgets/app_txt_field.dart';

class Mapscreen extends StatelessWidget {
  Mapscreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          zoomControlsEnabled: true,
          initialCameraPosition: CameraPosition(
              zoom: 14.0, target: LatLng(37.42796133580664, -122.085749655962)),
        ),
        Positioned(
            right: 90,
            top: 20,
            left: 20,
            bottom: 30,
            child: AppTextField(
              prefixIcon: const Icon(Icons.search),
              hintText: "Search",
              fillcolor: AppColors.whiteColor,
              contentPadding: EdgeInsets.symmetric(horizontal: 20.r),
            )),
        GestureDetector(
          onTap: (){},
          child: Positioned(
              right: 20,
              top: 18,
              child: Container(
                width: 50.w,
                height: 50.h,
                decoration: BoxDecoration(
                    color: AppColors.darkredcolor,
                    borderRadius: BorderRadius.circular(12)),
                child: Icon(
                  Icons.bookmark_outline,
                  color: AppColors.whiteColor,
                ),
              )),
        ),
      ],
    );
  }

  Widget _savedplace() {
    return Column(
      children: [
        Icon(Icons.arrow_drop_down),
        GlobalText(
          "Place you Saved",
          textStyle:
              textStyle16.copyWith(color: AppColors.textcolor.withOpacity(0.9)),
        )

      ],
    );
  }
}
