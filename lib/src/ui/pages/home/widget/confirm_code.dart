import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({
    required this.number,
    required this.onTap,
    super.key,
  });
  final int? number;
  final void Function(int? number) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(number),
      child: SizedBox(
        height: 20,
        width: 20,
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: number != null ? const Color(0xFF34A853) : null,
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: number != null ? Text("$number") : null,
        ),
      ),
    );
  }
}
