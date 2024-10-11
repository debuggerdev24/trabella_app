import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/styles.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.labelText = '',
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.hintText,
    this.controller,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.keyboardType,
    this.inputFormatters,
    this.prefixText,
    this.onTap,
    this.obSecureText,
    this.style,
    this.labelStyle,
    this.border,
    this.contentPadding,
    this.maxLength,
    this.suffix,
    this.prefix,
    this.errorBorder,
    this.maxLines,
    this.outlineInputBorder,
    this.hintStyle,
    this.fillcolor,
    this.enabled,
    this.isRequired = false,
    this.bottomText,
    this.bottomTextStyle,
    this.readOnly = false,
    this.textAlign = TextAlign.start,
  });

  final String? labelText;

  final bool isRequired;
  final Widget? prefixIcon;
  final String? prefixText;
  final Widget? suffixIcon;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final Function(String?)? onChanged;
  final void Function()? onTap;
  final AutovalidateMode? autoValidateMode;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? obSecureText;
  final InputBorder? border;
  final InputBorder? errorBorder;
  final OutlineInputBorder? outlineInputBorder;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLength;
  final Widget? suffix;
  final Widget? prefix;
  final int? maxLines;
  final bool? enabled;
  final String? bottomText;
  final TextStyle? bottomTextStyle;
  final bool readOnly;
  final Color? fillcolor;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        labelText?.isNotEmpty ?? false
            ? Container(
                height: 30.h,
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
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
            : const SizedBox(),
        TextFormField(
          enabled: enabled ?? true,
          expands: false,
          // name: name,
          readOnly: readOnly,
          maxLength: maxLength,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          controller: controller,
          textAlign: textAlign,
          autovalidateMode:
              autoValidateMode ?? AutovalidateMode.onUserInteraction,
          obscureText: obSecureText ?? false,
          cursorColor: AppColors.blackColor,
          cursorHeight: 30,
          style: textStyle16.copyWith(color: AppColors.blackColor),
          onTap: onTap,
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            prefixText: prefixText,
            prefixStyle: style,
            suffixIcon: suffixIcon,
            suffix: suffix,
            prefix: prefix,
            hintText: hintText,
            fillColor: fillcolor,
            filled: true,
            hintStyle: hintStyle ?? textStyle14.copyWith(color: Colors.grey),
            contentPadding: contentPadding ??
                REdgeInsets.symmetric(horizontal: 15.r, vertical: 23.r),
            disabledBorder: border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
            enabledBorder: border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: const BorderSide(color: AppColors.greycolor),
                ),
            focusedBorder: border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: const BorderSide(color: AppColors.greycolor),
                ),
            border: border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: const BorderSide(
                    color: AppColors.greycolor,
                  ),
                ),
            errorBorder: errorBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
          ),
          validator: validator,
          onChanged: onChanged,
          maxLines: maxLines,
        ),
        if (bottomText != null)
          Align(
            alignment: Alignment.topRight,
            child: Text(
              bottomText!,
              style: textStyle12.copyWith(color: AppColors.greycolor),
            ),
          )
      ],
    );
  }
}
