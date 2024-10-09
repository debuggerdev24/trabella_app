import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/styles.dart';

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

  @override
  Widget build(BuildContext context) {
    labelText?.isNotEmpty ?? false
        ? Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: labelText,
                  style: labelStyle ??
                      textStyle16.copyWith(color: AppColors.blackColor),
                ),
              ]),
            ),
          )
        : const SizedBox.shrink();
    return DropdownButtonFormField(
      dropdownColor: AppColors.backgroungcolor,
      // name: name,
      value: value,
      items: dropDownList,
      onChanged: onChanged,
      isDense: true,

      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: labelStyle ??
            textStyle16.copyWith(
                color: AppColors.blackColor, fontWeight: FontWeight.w400),
        filled: true,
        hintText: hintText ?? '',
        hintStyle: textStyle16.copyWith(color: Colors.black.withOpacity(0.4)),
        focusColor: AppColors.darkredcolor,
        fillColor: AppColors.backgroungcolor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: BorderSide(
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
