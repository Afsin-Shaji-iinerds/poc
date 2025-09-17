import 'package:flutter/services.dart';

class UsPhoneNumberFormatter extends TextInputFormatter {
  // Only allow up to 10 digits; re-format on every keystroke
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // 1️⃣ strip out non-digits
    final String digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');

    // 2️⃣ count how many digits were before the cursor
    final int cursorPosition = newValue.selection.end;
    int digitsBeforeCursor = 0;
    for (int i = 0; i < cursorPosition && i < newValue.text.length; i++) {
      if (RegExp(r'\d').hasMatch(newValue.text[i])) {
        digitsBeforeCursor++;
      }
    }

    // 3️⃣ rebuild masked string “(XXX) XXX-XXXX”
    final StringBuffer buffer = StringBuffer();
    for (int i = 0; i < digitsOnly.length && i < 10; i++) {
      if (i == 0) {
        buffer.write('(');
      }
      buffer.write(digitsOnly[i]);
      if (i == 2) {
        buffer.write(') ');
      }
      if (i == 5) {
        buffer.write('-');
      }
    }
    final String formatted = buffer.toString();

    // 4️⃣ place the cursor right after the same count of digits
    int newCursorPosition = formatted.length;
    int digitCounter = 0;
    for (int i = 0; i < formatted.length; i++) {
      if (RegExp(r'\d').hasMatch(formatted[i])) {
        digitCounter++;
      }
      if (digitCounter == digitsBeforeCursor) {
        newCursorPosition = i + 1;
        break;
      }
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: newCursorPosition),
    );
  }
}
