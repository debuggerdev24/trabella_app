import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/provider/home_provider.dart';
import 'package:travel_app/provider/trips_provider.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/routes/route.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/view/Trips/trip_createscreen.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/app_txt_field.dart';
import 'package:travel_app/widgets/calender_screen.dart';
import 'package:travel_app/widgets/date_picker.dart';
import 'package:travel_app/widgets/dropdown_txt_filed.dart';
import 'package:travel_app/widgets/tab_items.dart';
import 'package:travel_app/widgets/top_bar.dart';

class TripsScreen extends StatefulWidget {
  const TripsScreen({super.key});

  @override
  State<TripsScreen> createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _tripnamecontroller = TextEditingController();
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawers(),
      backgroundColor: AppColors.backgroungcolor,
      body: Consumer2<TripProvider, HomeProvider>(
          builder: (context, tripProvider, homeProvider, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopBar(),
            100.h.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: GlobalText(
                'Trip',
                textStyle: textStyle20SemiBold.copyWith(
                    color: AppColors.darkredcolor,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: GlobalText(
                'No upcoming trips yet...',
                textStyle: textStyle16.copyWith(
                  color: AppColors.textcolor,
                  fontSize: 20.sp,
                ),
              ),
            ),
            50.h.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: AppButton(
                  onPressed: () {
                    openAlertBox(homeProvider, tripProvider);
                  },
                  text: "PLAN YOUR NEXT TRIP"),
            ),
            
            Expanded(
              child: TabItems(
                tripProvider: tripProvider,
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget Drawers() {
    return Drawer(
      backgroundColor: AppColors.darkredcolor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: AppColors.darkredcolor),
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: SvgIcon(
                  AppAssets.drawercancel,
                  color: AppColors.whiteColor,
                  size: 36.sp,
                ),
              ),
            ),
          ),
          ListTile(
              onTap: () {
                context.pushNamed(AppRoute.myprofilescreen.name);
              },
              title: Text(
                "My Profile",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              leading: SvgIcon(
                AppAssets.myprofile,
                color: AppColors.whiteColor,
                size: 26,
              )),
          ListTile(
              onTap: () {},
              title: Text(
                "Invite Friends",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              leading: SvgIcon(
                AppAssets.invitefriend,
                color: AppColors.whiteColor,
                size: 26,
              )),
          ListTile(
              onTap: () {
                context.pushNamed(AppRoute.settingscreen.name);
              },
              title: Text(
                "Settings",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              leading: SvgIcon(
                AppAssets.setting,
                color: AppColors.whiteColor,
                size: 26,
              )),
          ListTile(
              onTap: () {},
              title: Text(
                "Log out",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              leading: SvgIcon(
                AppAssets.logout,
                color: AppColors.whiteColor,
                size: 26,
              )),
        ],
      ),
    );
  }

  void openAlertBox(HomeProvider provider, TripProvider tripprovider) {
    DateTime? _Formdate;
    DateTime? _Todate;

    showDialog(
      context: context,
      builder: (BuildContext cont) {
        PageController _dialogPageController = PageController(initialPage: 0);

        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
                shadowColor: AppColors.greycolor,
                backgroundColor: AppColors.backgroungcolor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.r)),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.h, vertical: 30.h),
                content: SizedBox(
                    width: 500.w,
                    height: 0.50.sh,
                    child: SizedBox(
                      height: 400.h,
                      child: PageView(
                        controller: _dialogPageController,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          createtrip(_dialogPageController),
                          _destination(_dialogPageController),
                          _flightAttendance(_dialogPageController),
                          _accommodation(_dialogPageController, () {
                            context.pop();
                            context.pushNamed(AppRoute.tripsscreen.name);
                          }),
                        ],
                      ),
                    )));
          },
        );
      },
    );
  }

  List<DropdownMenuItem<String>> countrydropdownlist() =>
      ['Australia', 'Germany', 'Canada', 'USA']
          .map(
            (country) => DropdownMenuItem(
              value: country,
              child: Text(
                country,
                style: textStyle16,
              ),
            ),
          )
          .toList();

  Widget createtrip(PageController pageController) {
    final TextEditingController _tripnamecontroller = TextEditingController();

    return Column(
      children: [
        GlobalText(
          "Create Trip",
          textAlign: TextAlign.center,
          textStyle: textStyle20SemiBold.copyWith(
            color: AppColors.darkredcolor,
            fontSize: 30.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        50.h.verticalSpace,
        AppTextField(
          controller: _tripnamecontroller,
          labelText: "Name your trip",
          labelStyle: textStyle18SemiBold.copyWith(
            color: AppColors.blackColor,
          ),
          fillcolor: Colors.transparent,
        ),
        30.h.verticalSpace,
        AppButton(
          onPressed: () {
            pageController.nextPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          },
          text: "NEXT",
        ),
      ],
    );
  }

  Widget _destination(PageController pageController) {
    return Consumer<TripProvider>(
      builder: (context, tripProvider, child) {
        List<Map<String, dynamic>> _destinations = tripProvider.destinations;

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: SvgPicture.asset(AppAssets.cancel),
                ),
              ),
              10.h.verticalSpace,
              GlobalText(
                "Create trip",
                textAlign: TextAlign.center,
                textStyle: textStyle20SemiBold.copyWith(
                  color: AppColors.darkredcolor,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              20.h.verticalSpace,
              for (var i = 0; i < _destinations.length; i++) ...[
                GlobalText(
                  textAlign: TextAlign.start,
                  "Destination ${i + 1}",
                  textStyle: textStyle16.copyWith(
                      color: AppColors.blackColor, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CardDropDownField(
                    hintText: "Select Country",
                    value: _destinations[i]['country'],
                    onChanged: (value) {
                      tripProvider.updateDestination(i, 'country', value);
                    },
                    dropDownList: countrydropdownlist(),
                  ),
                ),
                20.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          DateTime? pickedDate =
                              await showDefultDatePicker(context);
                          if (pickedDate != null) {
                            tripProvider.updateDestination(
                                i, 'fromDate', pickedDate);
                          }
                        },
                        child: InputDecorator(
                          decoration: InputDecoration(
                            labelText: "From",
                            border: OutlineInputBorder(),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                textAlign: TextAlign.start,
                                _destinations[i]['fromDate'] != null
                                    ? "${_destinations[i]['fromDate'].day.toString().padLeft(2, '0')}/"
                                        "${_destinations[i]['fromDate'].month.toString().padLeft(2, '0')}/"
                                        "${_destinations[i]['fromDate'].year}"
                                    : "DD/MM/YY",
                              ),
                              Image.asset(AppAssets.datepicker),
                            ],
                          ),
                        ),
                      ),
                    ),
                    5.w.horizontalSpace,
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          DateTime? pickedDate =
                              await showDefultDatePicker(context);
                          if (pickedDate != null) {
                            tripProvider.updateDestination(
                                i, 'toDate', pickedDate);
                          }
                        },
                        child: InputDecorator(
                          decoration: InputDecoration(
                            labelText: "To",
                            border: OutlineInputBorder(),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                textAlign: TextAlign.start,
                                _destinations[i]['toDate'] != null
                                    ? "${_destinations[i]['toDate'].day.toString().padLeft(2, '0')}/"
                                        "${_destinations[i]['toDate'].month.toString().padLeft(2, '0')}/"
                                        "${_destinations[i]['toDate'].year}"
                                    : "DD/MM/YY",
                              ),
                              Image.asset(AppAssets.datepicker),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                30.h.verticalSpace,
                const DottedLine(),
                20.h.verticalSpace,
              ],
              Center(
                child: GestureDetector(
                  onTap: () {
                    tripProvider.addDestination({
                      "country": null,
                      "fromDate": null,
                      "toDate": null,
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColors.darkredcolor,
                    radius: 25.r,
                    child: Icon(Icons.add, color: Colors.white, size: 30.sp),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              AppButton(
                onPressed: () {
                  // Navigate to the next page
                  pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
                text: "NEXT",
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _flightAttendance(PageController pageController) {
    return Consumer<TripProvider>(
      builder: (context, tripProvider, child) {
        List<Map<String, dynamic>> flightAttendances =
            tripProvider.flightAttendances;

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pop(); // Use Navigator if context.pop() is not defined
                  },
                  child: SvgPicture.asset(AppAssets.cancel),
                ),
              ),
              SizedBox(
                  height:
                      10.0), // Replace with `10.h.verticalSpace` if using screen utils
              Center(
                child: GlobalText(
                  "Create trip",
                  textAlign: TextAlign.center,
                  textStyle: textStyle20SemiBold.copyWith(
                    color: AppColors.darkredcolor,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              for (var i = 0; i < flightAttendances.length; i++) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: AppTextField(
                    fillcolor: AppColors.backgroungcolor,
                    hintText: "QFXX",
                    labelText: "Flight Details",
                    onChanged: (value) {
                      tripProvider.updateFlightAttendance(
                          i, 'flightDetails', value);
                    },
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // From Date Picker
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          DateTime? pickedDate =
                              await showDefultDatePicker(context);
                          if (pickedDate != null) {
                            tripProvider.updateFlightAttendance(
                                i, 'fromDate', pickedDate);
                          }
                        },
                        child: InputDecorator(
                          decoration: InputDecoration(
                            labelText: "From",
                            border: OutlineInputBorder(),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                flightAttendances[i]['fromDate'] != null
                                    ? "${(flightAttendances[i]['fromDate'] as DateTime).day.toString().padLeft(2, '0')}/"
                                        "${(flightAttendances[i]['fromDate'] as DateTime).month.toString().padLeft(2, '0')}/"
                                        "${(flightAttendances[i]['fromDate'] as DateTime).year}"
                                    : "DD/MM/YY",
                              ),
                              Image.asset(AppAssets.datepicker),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5.0),
                    // To Time Picker
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );

                          if (pickedTime != null) {
                            tripProvider.updateFlightAttendance(
                                i, 'toTime', pickedTime);
                          }
                        },
                        child: InputDecorator(
                          decoration: InputDecoration(
                            labelText: "To",
                            border: OutlineInputBorder(),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                flightAttendances[i]['toTime'] != null
                                    ? "${(flightAttendances[i]['toTime'] as TimeOfDay).hour.toString().padLeft(2, '0')}:"
                                        "${(flightAttendances[i]['toTime'] as TimeOfDay).minute.toString().padLeft(2, '0')}"
                                    : "HH:MM",
                              ),
                              Image.asset(AppAssets.datepicker),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.0),
                const DottedLine(),
                SizedBox(height: 20.0),
              ],
              Center(
                child: GestureDetector(
                  onTap: () {
                    tripProvider.addFlightAttendance({
                      "flightDetails": null,
                      "fromDate": null,
                      "toTime": null,
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColors.darkredcolor,
                    radius: 25.0, // Replace with `25.r` if using screen utils
                    child: Icon(Icons.add,
                        color: Colors.white,
                        size:
                            30.0), // Replace with `30.sp` if using screen utils
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              AppButton(
                onPressed: () {
                  // Optionally, you can process or validate flightAttendances here
                  // Navigate to the next page
                  pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
                text: "NEXT",
              ),
              SizedBox(height: 10.0),
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Implement skip functionality if needed
                  },
                  child: GlobalText(
                    color: AppColors.greycolor,
                    'Skip',
                    textStyle: textStyle18SemiBold.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.textcolor.withOpacity(0.8),
                      color: AppColors.textcolor.withOpacity(0.8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _accommodation(PageController pageController, VoidCallback navigate) {
    return Consumer<TripProvider>(
      builder: (context, tripProvider, child) {
        List<Map<String, dynamic>> accommodations = tripProvider.accommodations;

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: SvgPicture.asset(AppAssets.cancel),
                ),
              ),
              SizedBox(height: 10.0),
              Center(
                child: GlobalText(
                  "Create trip",
                  textAlign: TextAlign.center,
                  textStyle: textStyle20SemiBold.copyWith(
                    color: AppColors.darkredcolor,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              for (var i = 0; i < accommodations.length; i++) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: AppTextField(
                    fillcolor: AppColors.backgroungcolor,
                    hintText: "Hotel Trabella",
                    labelText: "Accommodation Details",
                    onChanged: (value) {
                      tripProvider.updateAccommodation(
                          i, 'accommodationDetails', value);
                    },
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // From Date Picker
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          DateTime? pickedDate =
                              await showDefultDatePicker(context);
                          if (pickedDate != null) {
                            tripProvider.updateAccommodation(
                                i, 'fromDate', pickedDate);
                          }
                        },
                        child: InputDecorator(
                          decoration: InputDecoration(
                            labelText: "From",
                            border: OutlineInputBorder(),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                accommodations[i]['fromDate'] != null
                                    ? "${(accommodations[i]['fromDate'] as DateTime).day.toString().padLeft(2, '0')}/"
                                        "${(accommodations[i]['fromDate'] as DateTime).month.toString().padLeft(2, '0')}/"
                                        "${(accommodations[i]['fromDate'] as DateTime).year}"
                                    : "DD/MM/YY",
                              ),
                              Image.asset(AppAssets.datepicker),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5.0),
                    // To Date Picker
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          DateTime? pickedDate =
                              await showDefultDatePicker(context);
                          if (pickedDate != null) {
                            tripProvider.updateAccommodation(
                                i, 'toDate', pickedDate);
                          }
                        },
                        child: InputDecorator(
                          decoration: const InputDecoration(
                            labelText: "To",
                            border: OutlineInputBorder(),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                accommodations[i]['toDate'] != null
                                    ? "${(accommodations[i]['toDate'] as DateTime).day.toString().padLeft(2, '0')}/"
                                        "${(accommodations[i]['toDate'] as DateTime).month.toString().padLeft(2, '0')}/"
                                        "${(accommodations[i]['toDate'] as DateTime).year}"
                                    : "DD/MM/YY",
                              ),
                              Image.asset(AppAssets.datepicker),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.0),
                const DottedLine(),
                SizedBox(height: 20.0),
              ],
              Center(
                child: GestureDetector(
                  onTap: () {
                    tripProvider.addAccommodation({
                      "accommodationDetails": null,
                      "fromDate": null,
                      "toDate": null,
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColors.darkredcolor,
                    radius: 25.0,
                    child: Icon(Icons.add, color: Colors.white, size: 30.0),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              AppButton(
                onPressed: navigate,
                text: "NEXT",
              ),
              SizedBox(height: 10.0),
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: GlobalText(
                    color: AppColors.greycolor,
                    'Skip',
                    textStyle: textStyle18SemiBold.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.textcolor.withOpacity(0.8),
                      color: AppColors.textcolor.withOpacity(0.8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
