import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({Key? key, required this.number}) : super(key: key);
  final int? number;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
