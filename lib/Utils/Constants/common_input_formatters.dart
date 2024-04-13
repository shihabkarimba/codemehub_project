import 'package:flutter/services.dart';

class CommonInputFormatters {
  static final disableInitialWhiteSpace = FilteringTextInputFormatter(
    RegExp(r'^\s+'),
    allow: false,
    replacementString: '',
  );
}
