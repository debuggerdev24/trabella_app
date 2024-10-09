import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:travel_app/utils/app_assets.dart';

import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/styles.dart';

class Calendar extends StatelessWidget {
  Calendar({
    Key? key,
  }) : super(key: key);

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
                color: Colors.white,
                child: Column(
                  children: [
                    TableCalendar(
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle:
                            TextStyle(color: Colors.grey, fontSize: 16.sp),
                        weekendStyle:
                            TextStyle(color: Colors.grey, fontSize: 15.sp),
                        dowTextFormatter: (date, locale) =>
                            DateFormat.E(locale).format(date).substring(0, 1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(23),
                        ),
                      ),
                      daysOfWeekHeight: 50.h,
                      firstDay: DateTime.utc(2020, 10, 16),
                      lastDay: DateTime.utc(2050, 3, 14),
                      currentDay: DateTime.now(),
                      rowHeight: 55.sp,
                      formatAnimationCurve: Curves.easeInOut,
                      calendarFormat: CalendarFormat.month,
                      daysOfWeekVisible: true,
                      headerVisible: true,
                      headerStyle: HeaderStyle(
                        titleCentered: true,
                        formatButtonVisible: false,
                        titleTextStyle: TextStyle(
                          color: AppColors.textcolor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      focusedDay: focusedDay,
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
              padding: EdgeInsets.symmetric(horizontal: 40.r),
              child: ListTile(
                leading: SvgPicture.asset(AppAssets.portugal),
                title: Text('Portugal'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.r),
              child: ListTile(
                leading: SvgPicture.asset(AppAssets.france),
                title: Text('France'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.r),
              child: ListTile(
                leading: SvgPicture.asset(AppAssets.germany),
                title: Text('Germany'),
              ),
            ),
            20.h.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.r),
              child: Text(
                'Your itinerary',
                style: textStyle20SemiBold.copyWith(
                    color: AppColors.textcolor.withOpacity(0.9),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
            10.h.verticalSpace,
            itinerary(),
          ],
        ),
      ),
    );
  }

  Widget itinerary() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.r),
      child: Column(
        children: [
          Text(
            'Flights',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MEL',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text('10 OCT 2024', style: TextStyle(color: Colors.grey)),
                  Text('14:25', style: TextStyle(color: Colors.grey)),
                ],
              ),
              Icon(Icons.arrow_forward, color: Colors.red),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'LIS',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text('26 OCT 2024', style: TextStyle(color: Colors.grey)),
                  Text('09:55', style: TextStyle(color: Colors.grey)),
                ],
              ),
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {},
              ),
            ],
          ),
          Divider(),        
          Text(
            'Accommodation',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          ListTile(
            title: Text(
              'Hotel Lisbon',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Check in: 10 OCT 2024',
                    style: TextStyle(color: Colors.grey)),
                Text('Check out: 15 OCT 2024',
                    style: TextStyle(color: Colors.grey)),
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
            ),
          ),
          Divider(),

          // Another Accommodation (if needed)
          ListTile(
            title: Text(
              'Hotel Lisbon',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Check in: 10 OCT 2024',
                    style: TextStyle(color: Colors.grey)),
                Text('Check out: 15 OCT 2024',
                    style: TextStyle(color: Colors.grey)),
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}