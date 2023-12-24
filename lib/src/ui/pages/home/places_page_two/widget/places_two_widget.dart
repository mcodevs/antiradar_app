
import 'package:flutter/material.dart';

class PlacesTwoWidget extends StatelessWidget {
    const PlacesTwoWidget({Key? key,required this.child}) : super(key: key);

   final Widget child;

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: 60,
      width: 370,
      child: Card(
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.black,width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        elevation: 0,
        color: const Color(0xFFF3E8D4),
        child: child,
      ),
    );
  }
}
