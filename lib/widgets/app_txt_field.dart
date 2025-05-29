import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:travel_app/utils/styles.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.labelText,
    this.labelRichText,
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
    this.cursorColor,
  });

  final String? labelText;
  final RichText? labelRichText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final String? hintText;
  final TextEditingController? controller;
  final AutovalidateMode? autoValidateMode;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? prefixText;
  final VoidCallback? onTap;
  final bool? obSecureText;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final InputBorder? border;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLength;
  final Widget? suffix;
  final Widget? prefix;
  final InputBorder? errorBorder;
  final int? maxLines;
  final InputBorder? outlineInputBorder;
  final TextStyle? hintStyle;
  final Color? fillcolor;
  final bool? enabled;
  final bool isRequired;
  final String? bottomText;
  final TextStyle? bottomTextStyle;
  final bool readOnly;
  final TextAlign textAlign;
  final Color? cursorColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        (labelRichText != null || (labelText?.isNotEmpty ?? false))
            ? Container(
                height: 30.h,
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                alignment: Alignment.centerLeft,
                child: labelRichText ??
                    RichText(
                      text: TextSpan(
                        text: labelText,
                        style: labelStyle ??
                            textStyle18.copyWith(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color:AppColors.textcolor
                            ),
                      ),
                    ),
              )
            : const SizedBox(),
        TextFormField(
          enabled: enabled ?? true,
          expands: false,
          readOnly: readOnly,
          maxLength: maxLength,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          controller: controller,
          textAlign: textAlign,
          autovalidateMode:
              autoValidateMode ?? AutovalidateMode.onUserInteraction,
          obscureText: obSecureText ?? false,
          cursorColor: cursorColor ?? Colors.black,
          cursorHeight: 20,
          style: style ??
              TextStyle(
                fontSize: 18.sp,
                color: Colors.black,
              ),
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
            hintStyle: hintStyle ??
                TextStyle(
                  fontSize: 18.sp,
                  color:Colors.grey
                ),
            contentPadding: contentPadding ??
                EdgeInsets.symmetric(horizontal: 15.r, vertical: 16.r),
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
                  borderSide: const BorderSide(color: Colors.grey),
                ),
            focusedBorder: border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
            border: border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
            errorBorder: errorBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.r),
                  borderSide: const BorderSide(
                    color: Colors.red,
                  ),
                ),
          ),
          validator: validator,
          onChanged: onChanged,
          maxLines: obSecureText ?? false ? 1 : maxLines,
        ),
        if (bottomText != null)
          Align(
            alignment: Alignment.topRight,
            child: Text(
              bottomText!,
              style: bottomTextStyle ??
                  TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                  ),
            ),
          )
      ],
    );
  }
}