//  import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:path/path.dart';
// import 'package:provider/provider.dart';
// import 'package:travel_app/provider/wallet_provider.dart';
// import 'package:travel_app/utils/app_assets.dart';
// import 'package:travel_app/utils/app_colors.dart';
// import 'package:travel_app/utils/global_text.dart';
// import 'package:travel_app/utils/routes/route.dart';

// Widget drawers(BuildContext context) {
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

//   void openAlertBox({required VoidCallback onCreditCard}) {
//     showDialog(
//       barrierDismissible: true,
//       context: context,
//       builder: (BuildContext cont) {
//         return AlertDialog(
//             shadowColor: AppColors.greycolor,
//             backgroundColor: AppColors.backgroungcolor,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(12.r)),
//             ),
//             contentPadding:
//                 EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
//             content: _paymentmethods(onCreditCard: () {
//               cont.pop();

//               onCreditCard.call();
//             }));
//       },
//     );
//   }

//   Widget _paymentmethods({required VoidCallback onCreditCard}) {
//     return Consumer<WalletProvider>(builder: (context, walletprovider, _) {
//       return Padding(
//         padding: EdgeInsets.symmetric(
//           horizontal: 5.w,
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Align(
//               alignment: Alignment.topRight,
//               child: GestureDetector(
//                 onTap: () {
//                   context.pop();
//                 },
//                 child: SvgPicture.asset(AppAssets.cancel),
//               ),
//             ),
//             GlobalText(
//               "Payment  Method",
//               textAlign: TextAlign.center,
//               textStyle: textStyle20SemiBold.copyWith(
//                 color: AppColors.darkredcolor,
//                 fontSize: 20.sp,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             32.h.verticalSpace,
//             PaymentOption(
//                 onSelect: (value) {
//                   walletprovider.changeSelectedMethod(value);
//                 },
//                 value: PaymentMethosEnum.applePay,
//                 selectedValue: walletprovider.selectedMethod),
//             PaymentOption(
//                 onSelect: (value) {
//                   walletprovider.changeSelectedMethod(value);
//                 },
//                 value: PaymentMethosEnum.googlePay,
//                 selectedValue: walletprovider.selectedMethod),
//             PaymentOption(
//                 onSelect: (value) {
//                   walletprovider.changeSelectedMethod(value);
//                 },
//                 value: PaymentMethosEnum.paypal,
//                 selectedValue: walletprovider.selectedMethod),
//             PaymentOption(
//                 onSelect: (value) {
//                   walletprovider.changeSelectedMethod(value);
//                 },
//                 value: PaymentMethosEnum.creditCard,
//                 selectedValue: walletprovider.selectedMethod),
//             25.h.verticalSpace,
//             AppButton(
//                 onPressed: () {
//                   if (walletprovider.selectedMethod ==
//                       PaymentMethosEnum.creditCard) {
//                     onCreditCard.call();
//                   }
//                 },
//                 text: "ADD  CARD")
//           ],
//         ),
//       );
//     });
//   }

//   void _cardPayment() {
//     showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (BuildContext cont) {
//         return AlertDialog(
//             shadowColor: AppColors.greycolor,
//             backgroundColor: AppColors.backgroungcolor,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(12.r)),
//             ),
//             contentPadding:
//                 EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
//             content: _creditCard());
//       },
//     );
//   }

//   Widget _creditCard() {
//     return Consumer<WalletProvider>(builder: (context, walletprovider, _) {
//       return Padding(
//         padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 20.h),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Align(
//               alignment: Alignment.topRight,
//               child: GestureDetector(
//                 onTap: () {
//                   context.pop();
//                 },
//                 child: SvgPicture.asset(AppAssets.cancel),
//               ),
//             ),
//             GlobalText(
//               "Payment  Method",
//               textAlign: TextAlign.center,
//               textStyle: textStyle20SemiBold.copyWith(
//                 color: AppColors.darkredcolor,
//                 fontSize: 20.sp,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             32.h.verticalSpace,
//             AppTextField(
//               labelStyle:
//                   textStyle18SemiBold.copyWith(color: AppColors.blackColor),
//               fillcolor: Colors.transparent,
//               labelText: "Card holder name",
//             ),
//             AppTextField(
//               labelStyle:
//                   textStyle18SemiBold.copyWith(color: AppColors.blackColor),
//               fillcolor: Colors.transparent,
//               labelText: "Card number",
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: AppTextField(
//                     labelStyle: textStyle18SemiBold.copyWith(
//                         color: AppColors.blackColor),
//                     fillcolor: Colors.transparent,
//                     labelText: " Expiry date",
//                   ),
//                 ),
//                 10.w.horizontalSpace,
//                 Expanded(
//                   child: AppTextField(
//                     labelStyle: textStyle18SemiBold.copyWith(
//                         color: AppColors.blackColor),
//                     fillcolor: Colors.transparent,
//                     labelText: "CVV",
//                   ),
//                 )
//               ],
//             ),
//             25.h.verticalSpace,
//             AppButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 text: "ADD  CARD"),
//           ],
//         ),
//       );
//     });
//   }

//   Widget _transfer() {
//     return Consumer<WalletProvider>(builder: (context, walletprovider, _) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             50.h.verticalSpace,
//             GlobalText(
//               'You have',
//               textStyle: textStyle16.copyWith(
//                   color: AppColors.textcolor,
//                   fontSize: 20.sp,
//                   fontWeight: FontWeight.w600),
//             ),
//             12.h.verticalSpace,
//             GlobalText(
//               'AUD 50.00',
//               textStyle: textStyle16.copyWith(
//                   color: AppColors.textcolor.withOpacity(0.8),
//                   fontSize: 36.sp,
//                   fontWeight: FontWeight.w400),
//             ),
//             10.h.verticalSpace,
//             const Divider(
//               indent: 50,
//               endIndent: 50,
//               thickness: 2,
//               color: AppColors.darkredcolor,
//             ),
//             36.h.verticalSpace,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 _buildIconButton(
//                     value: WalletPaymetEnum.topup,
//                     currentValue: walletprovider.PaymentOption,
//                     onTap: () {
//                       topUp();
//                     }),
//                 _buildIconButton(
//                     value: WalletPaymetEnum.split,
//                     currentValue: walletprovider.PaymentOption,
//                     onTap: () {}),
//                 _buildIconButton(
//                     value: WalletPaymetEnum.transfer,
//                     currentValue: walletprovider.PaymentOption,
//                     onTap: () {}),
//                 _buildIconButton(
//                     value: WalletPaymetEnum.more,
//                     currentValue: walletprovider.PaymentOption,
//                     onTap: () {})
//               ],
//             )
//           ],
//         ),
//       );
//     });
//   }

//   Widget _buildIconButton(
//       {required WalletPaymetEnum value,
//       required WalletPaymetEnum currentValue,
//       required Function() onTap}) {
//     return Column(
//       children: [
//         GestureDetector(
//           onTap: onTap,
//           child: CircleAvatar(
//             backgroundColor: AppColors.darkredcolor,
//             radius: 25.0,
//             child: SvgPicture.asset(
//               value.getIcon(),
//             ),
//           ),
//         ),
//         10.h.verticalSpace,
//         GlobalText(
//           textAlign: TextAlign.start,
//           value.getTitle(),
//           textStyle: textStyle20SemiBold.copyWith(
//               fontSize: 18.sp,
//               color: AppColors.redcolor,
//               fontWeight: FontWeight.w600),
//         ),
//       ],
//     );
//   }

//   void topUp() {
//     showDialog(
//       barrierDismissible: true,
//       context: context,
//       builder: (BuildContext cont) {
//         return AlertDialog(
//             shadowColor: AppColors.greycolor,
//             backgroundColor: AppColors.backgroungcolor,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(12.r)),
//             ),
//             contentPadding:
//                 EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
//             content: _topup());
//       },
//     );
//   }

//   Widget _topup() {
//     return Consumer<WalletProvider>(builder: (context, walletprovider, _) {
//       return Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Align(
//             alignment: Alignment.topRight,
//             child: GestureDetector(
//               onTap: () {
//                 context.pop();
//               },
//               child: SvgPicture.asset(AppAssets.cancel),
//             ),
//           ),
//           GlobalText(
//             "Top up",
//             textStyle: textStyle20SemiBold.copyWith(
//               color: AppColors.darkredcolor,
//               fontSize: 30.sp,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           32.h.verticalSpace,
//           Center(
//             child: GlobalText(
//               'Enter amount',
//               textStyle: textStyle16.copyWith(
//                   color: AppColors.textcolor,
//                   fontSize: 25.sp,
//                   fontWeight: FontWeight.w600),
//             ),
//           ),
//           12.h.verticalSpace,
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 40.w),
//             child: AppTextField(
//               keyboardType: TextInputType.number,
//               fillcolor: AppColors.backgroungcolor,
//               textAlign: TextAlign.center,
//               border: const UnderlineInputBorder(
//                   borderSide: BorderSide(
//                       color: AppColors.darkredcolor,
//                       width: 2,
//                       strokeAlign: 20)),
//               hintText: 'AUD 00.00',
//               hintStyle:
//                   textStyle16.copyWith(fontSize: 35.sp, color: Colors.grey),
//             ),
//           ),
//           30.h.verticalSpace,
//           const Wrap(
//             spacing: 5,
//             runSpacing: 20,
//             children: [
//               TopUpChip(text: "AUD 50"),
//               TopUpChip(text: "AUD 100"),
//               TopUpChip(text: "AUD 150"),
//               TopUpChip(text: "AUD 200")
//             ],
//           ),
//           50.h.verticalSpace,
//           AppButton(
//               onPressed: () {
//                 context.pop();
//                 toptransfer();
//               },
//               text: "TOP UP")
//         ],
//       );
//     });
//   }

//   void toptransfer() {
//     showDialog(
//       barrierDismissible: true,
//       context: context,
//       builder: (BuildContext cont) {
//         return AlertDialog(
//             shadowColor: AppColors.greycolor,
//             backgroundColor: AppColors.darkredcolor,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(12.r)),
//             ),
//             content: SizedBox(
//               height: 450.h,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Align(
//                     alignment: Alignment.topRight,
//                     child: GestureDetector(
//                       onTap: () {
//                         context.pop();
//                       },
//                       child: SvgPicture.asset(
//                         AppAssets.cancel,
//                         color: AppColors.backgroungcolor,
//                       ),
//                     ),
//                   ),
//                   150.h.verticalSpace,
//                   Center(
//                     child: GlobalText(
//                       textAlign: TextAlign.center,
//                       "Top up successfully done!",
//                       textStyle: textStyle20SemiBold.copyWith(
//                         color: AppColors.backgroungcolor,
//                         fontSize: 35.sp,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ));
//       },
//     );
//   }
// }