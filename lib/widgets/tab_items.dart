import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/provider/trips_provider.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/enum/trip_tab_enum.dart';
import 'package:travel_app/widgets/calender_screen.dart';
import 'package:travel_app/widgets/map_shown.dart';

class TabItems extends StatefulWidget {
  const TabItems({super.key, required this.tripProvider});
  final TripProvider tripProvider;

  @override
  State<TabItems> createState() => _TabItemsState();
}

class _TabItemsState extends State<TabItems>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 45.h,
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
          decoration: BoxDecoration(
              color: const Color(0xffE6E6E6),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Expanded(
                child: tripTab(
                    value: TripTabEnum.calender,
                    currentValue: widget.tripProvider.currentTripTab,
                    onTap: (value) {
                      widget.tripProvider.chnageTripTab(value);
                    }),
              ),
              Expanded(
                child: tripTab(
                    value: TripTabEnum.map,
                    currentValue: widget.tripProvider.currentTripTab,
                    onTap: (value) {
                      widget.tripProvider.chnageTripTab(value);
                    }),
              ),
              Expanded(
                child: tripTab(
                    value: TripTabEnum.todo,
                    currentValue: widget.tripProvider.currentTripTab,
                    onTap: (value) {
                      widget.tripProvider.chnageTripTab(value);
                    }),
              ),
            ],
          ),
        ),
        20.h.verticalSpace,
        Expanded(
            child: switch (widget.tripProvider.currentTripTab) {
          TripTabEnum.calender => Calendar(),
          TripTabEnum.map => Mapscreen(),
          TripTabEnum.todo => Calendar(),
        })
      ],
    );
  }

  Widget tripTab(
      {required TripTabEnum value,
      required TripTabEnum currentValue,
      required Function(TripTabEnum) onTap}) {
    return InkWell(
      onTap: () {
        if (value == currentValue) return;
        onTap(value);
      },
      borderRadius: BorderRadius.circular(10.r),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 43,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: value == currentValue
                ? AppColors.darkredcolor
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10.r)),
        child: Text(value.getTitle(),
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: value == currentValue
                    ? AppColors.whiteColor
                    : AppColors.textcolor)),
      ),
    );
  }
}