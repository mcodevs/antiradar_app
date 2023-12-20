import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class CustomPinPut extends StatelessWidget {
  const CustomPinPut({
    super.key,
    required this.pinController,
    required this.focusNode,
    required this.defaultPinTheme,
    required this.fillColor,
  });

  final TextEditingController pinController;
  final FocusNode focusNode;
  final PinTheme defaultPinTheme;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 5,
      controller: pinController,
      focusNode: focusNode,
      onSubmitted: (value) {
        FocusScope.of(context).unfocus();
      },
      useNativeKeyboard: false,
      defaultPinTheme: defaultPinTheme,
      separatorBuilder: (index) => const SizedBox(width: 8),
      onCompleted: (pin) {
        debugPrint('onCompleted: $pin');
      },
      onChanged: (value) {
        debugPrint('onChanged: $value');
      },
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 9),
            width: 22,
            height: 1,
            color: Colors.black,
          ),
        ],
      ),
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black),
        ),
      ),
      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          color: fillColor,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(color: Colors.black),
        ),
      ),
      errorPinTheme: defaultPinTheme.copyBorderWith(
        border: Border.all(color: Colors.redAccent),
      ),
    );
  }
}
