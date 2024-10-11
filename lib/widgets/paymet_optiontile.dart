import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/enum/payment_methos_enum.dart';
import 'package:travel_app/utils/enum/trip_tab_enum.dart';
import 'package:travel_app/utils/global_text.dart';
import 'package:travel_app/utils/styles.dart';

class PaymentOption extends StatelessWidget {
  final PaymentMethosEnum value;
  final PaymentMethosEnum selectedValue;
  final Function(PaymentMethosEnum) onSelect;

  PaymentOption(
      {required this.onSelect,
      required this.value,
      required this.selectedValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 5.h),
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.greycolor),
          borderRadius: BorderRadius.circular(40.r)),
      child: Row(
        children: [
          if (value != PaymentMethosEnum.creditCard) ...[
            SvgPicture.asset(value.getIcon()),
            10.w.horizontalSpace,
          ],
          GlobalText(value.getTitle(),
              textStyle: textStyle20SemiBold.copyWith(
                  fontWeight: FontWeight.w600, fontSize: 15.sp)),
          Spacer(),
          Radio<PaymentMethosEnum>(
            activeColor: AppColors.darkredcolor,
            value: value,
            groupValue: selectedValue,
            onChanged: (value) {
              {
                if (value != null) {
                  onSelect(value);
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
