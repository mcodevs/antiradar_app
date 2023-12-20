import 'package:flutter/material.dart';

import '../../intro/widget/confirm_code.dart';

class CustomCalculateButton extends StatelessWidget {
  final void Function(String value) onButtonPressed;

  const CustomCalculateButton({
    super.key,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: FractionallySizedBox(
        alignment: Alignment.center,
        widthFactor: 0.55,
        heightFactor: 0.94,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            4,
            (i) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                3,
                (j) {
                  final index = i * 3 + j + 1;
                  final value = switch (index) {
                    <= 9 => '$index',
                    == 10 => 'x',
                    == 11 => '0',
                    _ => '<',
                  };
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: ConfirmButton(
                      radius: 7,
                      onPressed: () => onButtonPressed(value),
                      size: 60,
                      child: Center(
                        child: Text(
                          value,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
