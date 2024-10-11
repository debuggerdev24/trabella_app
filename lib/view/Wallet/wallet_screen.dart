import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/provider/wallet_provider.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/enum/payment_methos_enum.dart';
import 'package:travel_app/utils/enum/wallet_paymet_enum.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/routes/route.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:travel_app/widgets/app_button.dart';
import 'package:travel_app/widgets/app_txt_field.dart';
import 'package:travel_app/widgets/destination_chip.dart';
import 'package:travel_app/widgets/dropdown_txt_filed.dart';
import 'package:travel_app/widgets/paymet_optiontile.dart';
import 'package:travel_app/widgets/top_bar.dart';
import 'package:travel_app/widgets/topup_chip.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  bool cardadding = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawers(),
      backgroundColor: AppColors.backgroungcolor,
      body: Consumer<WalletProvider>(builder: (context, walletprovider, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopBar(),
            Center(
              child: Switch.adaptive(
                value: cardadding,
                onChanged: (bool value) {
                  setState(() {
                    cardadding = value;
                  });
                },
                activeColor: AppColors.darkredcolor,
              ),
            ),
            100.h.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: GlobalText(
                textAlign: TextAlign.start,
                'Wallet',
                textStyle: textStyle20SemiBold.copyWith(
                    color: AppColors.redcolor,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
            10.h.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: GlobalText(
                'Trabella wallet makes it easier for you to transfer and split fares with other Trabellas.',
                textStyle: textStyle16.copyWith(
                  color: AppColors.textcolor,
                  fontSize: 15.sp,
                ),
              ),
            ),
            30.h.verticalSpace,
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: cardadding
                    ? AppButton(
                        onPressed: () {
                          openAlertBox(onCreditCard: () {
                            _cardPayment();
                          });
                        },
                        text: "ADD CARD")
                    : _transfer()),
          ],
        );
      }),
    );
  }

  Widget drawers() {
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

  void openAlertBox({required VoidCallback onCreditCard}) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext cont) {
        return AlertDialog(
            shadowColor: AppColors.greycolor,
            backgroundColor: AppColors.backgroungcolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            content: _paymentmethods(onCreditCard: () {
              cont.pop();

              onCreditCard.call();
            }));
      },
    );
  }

  Widget _paymentmethods({required VoidCallback onCreditCard}) {
    return Consumer<WalletProvider>(builder: (context, walletprovider, _) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: SvgPicture.asset(AppAssets.cancel),
              ),
            ),
            GlobalText(
              "Payment  Method",
              textAlign: TextAlign.center,
              textStyle: textStyle20SemiBold.copyWith(
                color: AppColors.darkredcolor,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            32.h.verticalSpace,
            PaymentOption(
                onSelect: (value) {
                  walletprovider.changeSelectedMethod(value);
                },
                value: PaymentMethosEnum.applePay,
                selectedValue: walletprovider.selectedMethod),
            PaymentOption(
                onSelect: (value) {
                  walletprovider.changeSelectedMethod(value);
                },
                value: PaymentMethosEnum.googlePay,
                selectedValue: walletprovider.selectedMethod),
            PaymentOption(
                onSelect: (value) {
                  walletprovider.changeSelectedMethod(value);
                },
                value: PaymentMethosEnum.paypal,
                selectedValue: walletprovider.selectedMethod),
            PaymentOption(
                onSelect: (value) {
                  walletprovider.changeSelectedMethod(value);
                },
                value: PaymentMethosEnum.creditCard,
                selectedValue: walletprovider.selectedMethod),
            25.h.verticalSpace,
            AppButton(
                onPressed: () {
                  if (walletprovider.selectedMethod ==
                      PaymentMethosEnum.creditCard) {
                    onCreditCard.call();
                  }
                },
                text: "ADD  CARD")
          ],
        ),
      );
    });
  }

  void _cardPayment() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext cont) {
        return AlertDialog(
            shadowColor: AppColors.greycolor,
            backgroundColor: AppColors.backgroungcolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            content: _creditCard());
      },
    );
  }

  Widget _creditCard() {
    return Consumer<WalletProvider>(builder: (context, walletprovider, _) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: SvgPicture.asset(AppAssets.cancel),
              ),
            ),
            GlobalText(
              "Payment  Method",
              textAlign: TextAlign.center,
              textStyle: textStyle20SemiBold.copyWith(
                color: AppColors.darkredcolor,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            32.h.verticalSpace,
            AppTextField(
              labelStyle:
                  textStyle18SemiBold.copyWith(color: AppColors.blackColor),
              fillcolor: Colors.transparent,
              labelText: "Card holder name",
            ),
            AppTextField(
              labelStyle:
                  textStyle18SemiBold.copyWith(color: AppColors.blackColor),
              fillcolor: Colors.transparent,
              labelText: "Card number",
            ),
            Row(
              children: [
                Expanded(
                  child: AppTextField(
                    labelStyle: textStyle18SemiBold.copyWith(
                        color: AppColors.blackColor),
                    fillcolor: Colors.transparent,
                    labelText: " Expiry date",
                  ),
                ),
                10.w.horizontalSpace,
                Expanded(
                  child: AppTextField(
                    labelStyle: textStyle18SemiBold.copyWith(
                        color: AppColors.blackColor),
                    fillcolor: Colors.transparent,
                    labelText: "CVV",
                  ),
                )
              ],
            ),
            25.h.verticalSpace,
            AppButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: "ADD  CARD"),
          ],
        ),
      );
    });
  }

  Widget _transfer() {
    return Consumer<WalletProvider>(builder: (context, walletprovider, _) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            50.h.verticalSpace,
            GlobalText(
              'You have',
              textStyle: textStyle16.copyWith(
                  color: AppColors.textcolor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600),
            ),
            12.h.verticalSpace,
            GlobalText(
              'AUD 50.00',
              textStyle: textStyle16.copyWith(
                  color: AppColors.textcolor.withOpacity(0.8),
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w400),
            ),
            10.h.verticalSpace,
            const Divider(
              indent: 50,
              endIndent: 50,
              thickness: 2,
              color: AppColors.darkredcolor,
            ),
            36.h.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIconButton(
                    value: WalletPaymetEnum.topup,
                    currentValue: walletprovider.PaymentOption,
                    onTap: () {
                      topUp();
                    }),
                _buildIconButton(
                    value: WalletPaymetEnum.split,
                    currentValue: walletprovider.PaymentOption,
                    onTap: () {
                      spiltbill();
                    }),
                _buildIconButton(
                    value: WalletPaymetEnum.transfer,
                    currentValue: walletprovider.PaymentOption,
                    onTap: () {
                      transferbill();
                    }),
                _buildIconButton(
                    value: WalletPaymetEnum.more,
                    currentValue: walletprovider.PaymentOption,
                    onTap: () {})
              ],
            )
          ],
        ),
      );
    });
  }

  Widget _buildIconButton(
      {required WalletPaymetEnum value,
      required WalletPaymetEnum currentValue,
      required Function() onTap}) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: CircleAvatar(
            backgroundColor: AppColors.darkredcolor,
            radius: 25.0,
            child: SvgPicture.asset(
              value.getIcon(),
            ),
          ),
        ),
        10.h.verticalSpace,
        GlobalText(
          textAlign: TextAlign.start,
          value.getTitle(),
          textStyle: textStyle20SemiBold.copyWith(
              fontSize: 18.sp,
              color: AppColors.redcolor,
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  void topUp() {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext cont) {
        return AlertDialog(
            shadowColor: AppColors.greycolor,
            backgroundColor: AppColors.backgroungcolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            content: _topup());
      },
    );
  }

  Widget _topup() {
    return Consumer<WalletProvider>(builder: (context, walletprovider, _) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                context.pop();
              },
              child: SvgPicture.asset(AppAssets.cancel),
            ),
          ),
          GlobalText(
            "Top up",
            textStyle: textStyle20SemiBold.copyWith(
              color: AppColors.darkredcolor,
              fontSize: 30.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          32.h.verticalSpace,
          Center(
            child: GlobalText(
              'Enter amount',
              textStyle: textStyle16.copyWith(
                  color: AppColors.textcolor,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
          12.h.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: AppTextField(
              keyboardType: TextInputType.number,
              fillcolor: AppColors.backgroungcolor,
              textAlign: TextAlign.center,
              border: const UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.darkredcolor,
                      width: 2,
                      strokeAlign: 20)),
              hintText: 'AUD 00.00',
              hintStyle:
                  textStyle16.copyWith(fontSize: 35.sp, color: Colors.grey),
            ),
          ),
          30.h.verticalSpace,
          const Wrap(
            spacing: 5,
            runSpacing: 20,
            children: [
              TopUpChip(text: "AUD 50"),
              TopUpChip(text: "AUD 100"),
              TopUpChip(text: "AUD 150"),
              TopUpChip(text: "AUD 200")
            ],
          ),
          50.h.verticalSpace,
          AppButton(
              onPressed: () {
                context.pop();
                toptransfer();
              },
              text: "TOP UP")
        ],
      );
    });
  }

  void toptransfer() {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext cont) {
        return AlertDialog(
            shadowColor: AppColors.greycolor,
            backgroundColor: AppColors.darkredcolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
            ),
            content: SizedBox(
              height: 450.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: SvgPicture.asset(
                        AppAssets.cancel,
                        color: AppColors.backgroungcolor,
                      ),
                    ),
                  ),
                  150.h.verticalSpace,
                  Center(
                    child: GlobalText(
                      textAlign: TextAlign.center,
                      "Top up successfully done!",
                      textStyle: textStyle20SemiBold.copyWith(
                        color: AppColors.backgroungcolor,
                        fontSize: 35.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }

  void spiltbill() {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext cont) {
        return AlertDialog(
            shadowColor: AppColors.greycolor,
            backgroundColor: AppColors.backgroungcolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            content: _splitbill());
      },
    );
  }

  Widget _splitbill() {
    return Consumer<WalletProvider>(builder: (context, walletprovider, _) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                context.pop();
              },
              child: SvgPicture.asset(AppAssets.cancel),
            ),
          ),
          GlobalText(
            "Split the bills",
            textStyle: textStyle20SemiBold.copyWith(
              color: AppColors.darkredcolor,
              fontSize: 30.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          30.h.verticalSpace,
          Center(
            child: GlobalText(
              'Enter amount',
              textStyle: textStyle16.copyWith(
                color: AppColors.textcolor,
                fontSize: 25.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: AppTextField(
              keyboardType: TextInputType.number,
              fillcolor: AppColors.backgroungcolor,
              textAlign: TextAlign.center,
              border: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.darkredcolor,
                  width: 2,
                  strokeAlign: 20,
                ),
              ),
              hintText: 'AUD 50.00',
              hintStyle:
                  textStyle16.copyWith(fontSize: 35.sp, color: Colors.grey),
            ),
          ),
          10.h.verticalSpace,
          Center(
            child: GlobalText(
              'Between',
              textStyle: textStyle14.copyWith(
                color: AppColors.textcolor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          10.h.verticalSpace,
          CardDropDownField(
            value: "Jordan",
            onChanged: (value) {},
            dropDownList: countrydropdownlist(),
          ),
          20.h.verticalSpace,
          Center(
            child: CircleAvatar(
              backgroundColor: AppColors.darkredcolor,
              radius: 25.0,
              child: SvgPicture.asset(AppAssets.addlanguage),
            ),
          ),
          10.h.verticalSpace,
          Center(
            child: GlobalText(
              'For',
              textStyle: textStyle14.copyWith(
                color: AppColors.textcolor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          20.h.verticalSpace,
          Container(
            height: 60.h,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(color: AppColors.greycolor)),
            child: const Center(child: GlobalText("Dinner")),
          ),
          30.h.verticalSpace,
          Row(
            children: [
              AppButton(
                type: AppButtonWidthType.half,
                onPressed: () {
                  context.pop();
                  evenlybill();
                },
                text: "EVENLY",
              ),
              10.w.horizontalSpace,
              AppButton(
                type: AppButtonWidthType.half,
                onPressed: () {},
                text: "%",
              ),
            ],
          ),
        ],
      );
    });
  }

  void evenlybill() {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext cont) {
        return AlertDialog(
            shadowColor: AppColors.greycolor,
            backgroundColor: AppColors.backgroungcolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            content: _evenlybill());
      },
    );
  }

  Widget _evenlybill() {
    return Consumer<WalletProvider>(builder: (context, walletprovider, _) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                context.pop();
              },
              child: SvgPicture.asset(AppAssets.cancel),
            ),
          ),
          GlobalText(
            "Split the bills",
            textStyle: textStyle20SemiBold.copyWith(
              color: AppColors.darkredcolor,
              fontSize: 30.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          30.h.verticalSpace,
          Center(
            child: GlobalText(
              'You’ve split',
              textStyle: textStyle16.copyWith(
                color: AppColors.textcolor,
                fontSize: 25.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: AppTextField(
              keyboardType: TextInputType.number,
              fillcolor: AppColors.backgroungcolor,
              textAlign: TextAlign.center,
              border: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.darkredcolor,
                  width: 2,
                  strokeAlign: 20,
                ),
              ),
              hintText: 'AUD 50.00',
              hintStyle:
                  textStyle16.copyWith(fontSize: 35.sp, color: Colors.grey),
            ),
          ),
          20.h.verticalSpace,
          Center(
            child: GlobalText(
              'Evenly',
              textStyle: textStyle14.copyWith(
                color: AppColors.darkredcolor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          30.h.verticalSpace,
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(AppAssets.myprofile2),
            ),
            title: Text('You'),
            trailing: Text('AUD 25.00'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(AppAssets.myprofile2),
            ),
            title: Text('Amelia'),
            trailing: Text('AUD 25.00'),
          ),
          30.h.verticalSpace,
          AppButton(
              onPressed: () {
                context.pop();
                transferbill();
              },
              text: "TRANSFER"),
          20.h.verticalSpace,
          AppButton(
              onPressed: () {
                context.pop();
              },
              text: "REQUEST")
        ],
      );
    });
  }

  void transferbill() {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext cont) {
        return AlertDialog(
            shadowColor: AppColors.greycolor,
            backgroundColor: AppColors.backgroungcolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            content: _transferbill());
      },
    );
  }

  Widget _transferbill() {
    return Consumer<WalletProvider>(builder: (context, walletprovider, _) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                context.pop();
              },
              child: SvgPicture.asset(AppAssets.cancel),
            ),
          ),
          GlobalText(
            "Transfer",
            textStyle: textStyle20SemiBold.copyWith(
              color: AppColors.darkredcolor,
              fontSize: 30.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          30.h.verticalSpace,
          Center(
            child: GlobalText(
              'Enter amount',
              textStyle: textStyle16.copyWith(
                color: AppColors.textcolor,
                fontSize: 25.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: AppTextField(
              keyboardType: TextInputType.number,
              fillcolor: AppColors.backgroungcolor,
              textAlign: TextAlign.center,
              border: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.darkredcolor,
                  width: 2,
                  strokeAlign: 20,
                ),
              ),
              hintText: 'AUD 25.00',
              hintStyle:
                  textStyle16.copyWith(fontSize: 35.sp, color: Colors.grey),
            ),
          ),
          10.h.verticalSpace,
          Center(
            child: GlobalText(
              'Between',
              textStyle: textStyle14.copyWith(
                color: AppColors.textcolor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          10.h.verticalSpace,
          CardDropDownField(
            value: "Jordan",
            onChanged: (value) {},
            dropDownList: countrydropdownlist(),
          ),
          10.h.verticalSpace,
          Center(
            child: GlobalText(
              'For',
              textStyle: textStyle14.copyWith(
                color: AppColors.textcolor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          20.h.verticalSpace,
          Container(
            height: 60.h,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(color: AppColors.greycolor)),
            child: const Center(child: GlobalText("Dinner")),
          ),
          30.h.verticalSpace,
          AppButton(
            onPressed: () {
              context.pop();
              transfer();
            },
            text: "TRANSFER",
          ),
          10.w.horizontalSpace,
        ],
      );
    });
  }

  void transfer() {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext cont) {
        return AlertDialog(
            shadowColor: AppColors.greycolor,
            backgroundColor: AppColors.darkredcolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
            ),
            content: SizedBox(
              height: 450.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: SvgPicture.asset(
                        AppAssets.cancel,
                        color: AppColors.backgroungcolor,
                      ),
                    ),
                  ),
                  150.h.verticalSpace,
                  Center(
                    child: GlobalText(
                      textAlign: TextAlign.center,
                      "Transfer successfully done!",
                      textStyle: textStyle20SemiBold.copyWith(
                        color: AppColors.backgroungcolor,
                        fontSize: 35.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }

  List<DropdownMenuItem<String>> countrydropdownlist() =>
      ['Amelia', 'Emily', 'Jordan', 'camelia']
          .map(
            (country) => DropdownMenuItem(
              value: country,
              child: Row(
                children: [
                  CircleAvatar(
                      radius: 20.r,
                      child: Image.asset(
                        AppAssets.myprofile2,
                        fit: BoxFit.fill,
                      )),
                  20.w.horizontalSpace,
                  Text(
                    country,
                    style: textStyle16.copyWith(
                        fontSize: 20.sp, color: AppColors.textcolor),
                  ),
                ],
              ),
            ),
          )
          .toList();
}
