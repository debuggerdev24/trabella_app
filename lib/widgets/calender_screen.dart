import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:travel_app/utils/app_assets.dart';

import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/styles.dart';

class Calendar extends StatelessWidget {
  Calendar({
    Key? key,
  }) : super(key: key);

  final List<Map<String, String>> accommodations = [
    {
      'name': 'Hotel Lisbon',
      'checkIn': '10 OCT 2024',
      'checkOut': '15 OCT 2024'
    },
    {
      'name': 'Hotel Lisbon',
      'checkIn': '10 OCT 2024',
      'checkOut': '15 OCT 2024'
    },
  ];

  @override
  Widget build(BuildContext context) {
    DateTime focusedDay = DateTime.now();
    String headerText = DateFormat.MMMM().format(focusedDay);

    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.r),
              child: Card(
                elevation: 3,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: SfDateRangePicker(
                        headerHeight: 60.h,
                        todayHighlightColor: Colors.transparent,
                        
                        rangeSelectionColor:
                            AppColors.darkredcolor.withOpacity(0.2),
                        endRangeSelectionColor: AppColors.darkredcolor,
                        startRangeSelectionColor: AppColors.darkredcolor,
                        headerStyle: DateRangePickerHeaderStyle(
                            textStyle: textStyle18SemiBold.copyWith(
                                color: AppColors.blackColor),
                            textAlign: TextAlign.center,
                            backgroundColor: AppColors.whiteColor),
                        view: DateRangePickerView.month,
                        backgroundColor: AppColors.whiteColor,
                        selectionMode: DateRangePickerSelectionMode.range,
                        monthCellStyle: DateRangePickerMonthCellStyle(
                            textStyle: textStyle14SemiBold.copyWith(
                                color: AppColors.greycolor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.normal),
                            disabledDatesTextStyle:
                                textStyle12.copyWith(color: Colors.pink)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            20.h.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.r),
              child: Text(
                'Countries you are travelling to',
                style: textStyle20SemiBold.copyWith(
                    color: AppColors.textcolor.withOpacity(0.9),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.r),
              child: ListTile(
                leading: SvgPicture.asset(AppAssets.portugal),
                title: const Text('Portugal'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.r),
              child: ListTile(
                leading: SvgPicture.asset(AppAssets.france),
                title: Text('France'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.r),
              child: ListTile(
                leading: SvgPicture.asset(AppAssets.germany),
                title: const Text('Germany'),
              ),
            ),
            20.h.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.r),
              child: Text(
                'Your itinerary',
                style: textStyle20SemiBold.copyWith(
                    color: AppColors.textcolor,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
            10.h.verticalSpace,
            _buildFlightSection(),
            _buildAccommodationSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildFlightSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Flights",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          12.h.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GlobalText('MEL',
                      textStyle: textStyle18.copyWith(
                          fontSize: 30.sp,
                          color: AppColors.textcolor,
                          fontWeight: FontWeight.w600)),
                  4.h.verticalSpace,
                  GlobalText('10 OCT 2024',
                      textStyle: textStyle18.copyWith(
                        fontSize: 18.sp,
                        color: AppColors.greycolor,
                      )),
                  GlobalText("14:25",
                      textStyle: textStyle18.copyWith(
                        fontSize: 18.sp,
                        color: AppColors.greycolor,
                      )),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 50.h,
                ),
                child: SvgPicture.asset(
                  AppAssets.line,
                  height: 12,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GlobalText('LIS',
                      textStyle: textStyle18.copyWith(
                          fontSize: 30.sp,
                          color: AppColors.textcolor,
                          fontWeight: FontWeight.w600)),
                  4.h.verticalSpace,
                  GlobalText("26 OCT 2024",
                      textStyle: textStyle18.copyWith(
                        fontSize: 18.sp,
                        color: AppColors.greycolor,
                      )),
                  GlobalText("09:55",
                      textStyle: textStyle18.copyWith(
                        fontSize: 18.sp,
                        color: AppColors.greycolor,
                      )),
                  Editfiled(),
                ],
              ),
            ],
          ),
          const Divider(),
          8.h.verticalSpace,
        ],
      ),
    );
  }

  Widget _buildAccommodationSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalText(
            'Accommodation',
            textStyle: textStyle18.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
            ),
          ),
          15.h.verticalSpace,
          Column(
            children: accommodations.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, String> hotel = entry.value;

              return Padding(
                padding: EdgeInsets.only(right: 30.r),
                child: Column(
                  children: [
                    _buildHotelCard(hotel),
                    if (index < accommodations.length - 1) ...[
                      12.h.verticalSpace,
                      const Divider(color: Colors.grey, thickness: 1),
                      12.h.verticalSpace,
                    ],
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildHotelCard(Map<String, String> hotel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GlobalText(hotel['name']!,
            textStyle: textstyle30semiBold.copyWith(
                color: AppColors.textcolor, fontSize: 30.sp)),
        4.h.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlobalText(
                  'Check in',
                  textStyle: textStyle18.copyWith(
                      color: AppColors.textcolor, fontSize: 18.sp),
                ),
                GlobalText(
                  hotel['checkIn']!,
                  textStyle: textStyle18.copyWith(
                      color: AppColors.textcolor, fontSize: 18.sp),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GlobalText(
                  'Check out',
                  textStyle: textStyle18.copyWith(
                      color: AppColors.textcolor, fontSize: 18.sp),
                ),
                GlobalText(
                  hotel['checkOut']!,
                  textStyle: textStyle18.copyWith(
                      color: AppColors.textcolor, fontSize: 18.sp),
                ),
              ],
            ),
          ],
        ),
        20.h.verticalSpace,
        Align(alignment: Alignment.centerRight, child: Editfiled()),
      ],
    );
  }

  Widget Editfiled() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 22.h,
        width: 71.w,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GlobalText("EDIT",
                textStyle: textStyle18.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.textcolor,
                    fontWeight: FontWeight.bold)),
            5.w.horizontalSpace,
            SvgPicture.asset(
              AppAssets.edit,
            ),
          ],
        ),
      ),
    );
  }
}
