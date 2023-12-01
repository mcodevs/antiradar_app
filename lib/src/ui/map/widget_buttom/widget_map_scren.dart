

import 'package:flutter/material.dart';

import '../../pages/home/widget/confiro_code.dart';

class WidgetMap extends StatefulWidget {
  const WidgetMap({Key? key}) : super(key: key);

  @override
  State<WidgetMap> createState() => _WidgetMapState();
}


class _WidgetMapState extends State<WidgetMap> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 718,
      left: 10,
      right: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ConfirmButton(
            radius: 13,
            onPressed: () {},
            size: 60,
            child: const Center(
              child: Image(image: AssetImage("assets/images/settingImage.png"),height: 100,),
            ),
          ),
          ConfirmButton(
            radius: 40,
            onPressed: () {},
            size: 62,
            child: const Center(
              child: Image(image: AssetImage("assets/images/iconsImages.png")),
            ),
          ),
        ],
      ),
    );
  }
}
