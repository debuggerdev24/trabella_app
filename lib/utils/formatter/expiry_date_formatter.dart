import 'package:flutter/services.dart';

class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var inputText = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    inputText = inputText.replaceAll('/', '');

    var bufferString = StringBuffer();
    int nonZeroIndexValue = 0;

    for (int i = 0; i < inputText.length; i++) {
      bufferString.write(inputText[i]);
      nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue == 2 && nonZeroIndexValue != inputText.length) {
        bufferString.write('/');
      }
    }

    var string = bufferString.toString();

    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(
        offset: string.length,
      ),
    );
  }
}
