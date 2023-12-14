import 'package:antiradar/src/ui/widgets/translate.dart';
import 'package:flutter/material.dart';

abstract final class TextFieldValidators {
  static String? validatePassword(String? value, BuildContext context) {
    if (value != null) {
      if (value.isEmpty) {
        return translate(context: context, select: (l10n) => l10n.helloWorld);
      }
    }
  }
}
