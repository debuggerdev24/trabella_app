// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:travel_app/utils/app_assets.dart';
// import 'package:travel_app/utils/app_colors.dart';
// import 'package:travel_app/utils/global_text.dart';
// import 'package:travel_app/utils/routes/route.dart';
// import 'package:travel_app/utils/styles.dart';
// import 'package:travel_app/widgets/tab_items.dart';
// import 'package:travel_app/widgets/top_bar.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class TripcreatedScreen extends StatefulWidget {
//   const TripcreatedScreen({
//     super.key,
//   });

//   @override
//   State<TripcreatedScreen> createState() => _TripcreatedScreenState();
// }

// class _TripcreatedScreenState extends State<TripcreatedScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawers(),
//       backgroundColor: AppColors.backgroungcolor,
//       body: Stack(
//         children: [
//           Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             const TopBar(),
//             20.h.verticalSpace,
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 30.w),
//               child: GlobalText(
//                 'Trip',
//                 textStyle: textStyle20SemiBold.copyWith(
//                     color: AppColors.darkredcolor,
//                     fontSize: 30.sp,
//                     fontWeight: FontWeight.w600),
//               ),
//             ),
//             20.h.verticalSpace,
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 40.w),
//               child: Stack(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(12.r),
//                     child: Image.asset(
//                       AppAssets.homebackground,
//                       height: 200.h,
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 10,
//                     left: 10,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         GlobalText(
//                           "[Trip Name]",
//                           textStyle: textStyle18SemiBold.copyWith(
//                               color: AppColors.whiteColor, fontSize: 32.sp),
//                         ),
//                         Row(
//                           children: [
//                             4.h.verticalSpace,
//                             Text(
//                               "26 OCT – 5 NOV",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16.sp,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             30.h.verticalSpace,
//             const TabItems(),
//           ]),
//         ],
//       ),
//     );
//   }

//   Widget Drawers() {
//     return Drawer(
//       backgroundColor: AppColors.darkredcolor,
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           DrawerHeader(
//             decoration: const BoxDecoration(color: AppColors.darkredcolor),
//             child: Align(
//               alignment: Alignment.topRight,
//               child: GestureDetector(
//                 onTap: () {
//                   context.pop();
//                 },
//                 child: SvgIcon(
//                   AppAssets.drawercancel,
//                   color: AppColors.whiteColor,
//                   size: 36.sp,
//                 ),
//               ),
//             ),
//           ),
//           ListTile(
//               onTap: () {
//                 context.pushNamed(AppRoute.myprofilescreen.name);
//               },
//               title: Text(
//                 "My Profile",
//                 style: TextStyle(color: Colors.white, fontSize: 16),
//               ),
//               leading: SvgIcon(
//                 AppAssets.myprofile,
//                 color: AppColors.whiteColor,
//                 size: 26,
//               )),
//           ListTile(
//               onTap: () {},
//               title: Text(
//                 "Invite Friends",
//                 style: TextStyle(color: Colors.white, fontSize: 16),
//               ),
//               leading: SvgIcon(
//                 AppAssets.invitefriend,
//                 color: AppColors.whiteColor,
//                 size: 26,
//               )),
//           ListTile(
//               onTap: () {
//                 context.pushNamed(AppRoute.settingscreen.name);
//               },
//               title: Text(
//                 "Settings",
//                 style: TextStyle(color: Colors.white, fontSize: 16),
//               ),
//               leading: SvgIcon(
//                 AppAssets.setting,
//                 color: AppColors.whiteColor,
//                 size: 26,
//               )),
//           ListTile(
//               onTap: () {},
//               title: Text(
//                 "Log out",
//                 style: TextStyle(color: Colors.white, fontSize: 16),
//               ),
//               leading: SvgIcon(
//                 AppAssets.logout,
//                 color: AppColors.whiteColor,
//                 size: 26,
//               )),
//         ],
//       ),
//     );
//   }
// }
