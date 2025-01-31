import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/utils/app_colors.dart';
import 'package:intl/intl.dart'; // Import intl for date formatting

class CustomDatePickers {
  static void showPicker({
    required BuildContext context,
    required DateTime initialDateTime,
    required Function(DateTime) onDateTimeChanged,
  }) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (_) {
        final size = MediaQuery.of(context).size;
        DateTime selectedDate = initialDateTime;

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
          height: size.height * 0.35,
          child: Column(
            children: [
              Expanded(
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  use24hFormat: true,
                  // Show Date, Month, Year
                  initialDateTime: initialDateTime,
                  onDateTimeChanged: (DateTime newDateTime) {
                    selectedDate = newDateTime;
                    onDateTimeChanged(newDateTime);
                  },
                ),
              ),
            ],
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
