import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/utils/app_assets.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardDropDownField extends StatelessWidget {
  const CardDropDownField({
    super.key,
    required this.dropDownList,
    this.labelText = "",
    this.hintText,
    this.leading,
    this.trailing,
    this.validator,
    this.labelStyle,
    this.value,
    this.isRequired = false,
    this.onChanged,
    this.dropdownIcon,
  });

  final String? labelText;
  final String? hintText;
  final Widget? leading;
  final Widget? trailing;
  final TextStyle? labelStyle;
  final String? Function(dynamic)? validator;
  final List<DropdownMenuItem> dropDownList;
  final dynamic value;
  final bool isRequired;
  final Function(dynamic)? onChanged;
  final String? dropdownIcon;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      dropdownColor: AppColors.backgroungcolor,
      value: value,
      items: dropDownList,
      onChanged: onChanged,
      isDense: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      icon: dropdownIcon != null
          ? SvgPicture.asset(
              AppAssets.down,
              width: 24.sp,
              height: 24.sp,
            )
          : const Icon(
              Icons.arrow_drop_down,
            ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: labelStyle ??
            textStyle16.copyWith(
              color: AppColors.blackColor,
              fontWeight: FontWeight.w400,
            ),
        filled: true,
        hintText: hintText ?? '',
        hintStyle: textStyle16.copyWith(color: Colors.black.withOpacity(0.4)),
        focusColor: AppColors.darkredcolor,
        fillColor: AppColors.backgroungcolor,
        prefixIcon: leading != null
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: leading,
              )
            : null,
        suffixIcon: trailing != null
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: trailing,
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: const BorderSide(
            color: AppColors.greycolor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: const BorderSide(
            color: AppColors.greycolor,
          ),
        ),
      ),
    );
  }
}
