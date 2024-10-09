import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/utils/app_colors.dart';

class CustomDatePickers {
  static void showPicker({
    required BuildContext context,
    required CupertinoDatePickerMode mode,
    required DateTime initialDateTime,
    required Function(DateTime) onDateTimeChanged,
  }) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (_) {
        final size = MediaQuery.of(context).size;
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                offset: Offset(2, 1),
                blurRadius: 3,
                color: AppColors.greycolor,
              ),
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
          ),
          height: size.height * 0.27,
          child: CupertinoDatePicker(
            mode: mode,
            initialDateTime: initialDateTime,
            onDateTimeChanged: onDateTimeChanged,
          ),
        );
      },
    );
  }
}

Future<DateTime?> showDefultDatePicker(BuildContext context) {
  return showDatePicker(
    context: context,
    firstDate: DateTime(0),
    lastDate: DateTime.now(),
    barrierDismissible: false,
    initialEntryMode: DatePickerEntryMode.calendarOnly,
  );
}
