import 'package:antiradar/src/ui/pages/map/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIndicator extends StatelessWidget {
  final String bottomText;
  final String speed;
  final String distance;
  final String speedLimit;

  const CustomIndicator({
    super.key,
    required this.bottomText,
    required this.speed,
    required this.distance,
    required this.speedLimit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 107.h,
      width: 329.w,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.r,
          color: const Color(0xFFFF0000),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(15.r),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(13.r),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      bottomText,
                      style: TextStyle(fontSize: 12.sp, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      width: 2.r,
                      height: 30.h,
                      color: Colors.black,
                    ),
                    const Image(
                      width: 30,
                      image: AssetImage("assets/images/belgi.png"),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Color(0xFFA027FF),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          speed,
                          style: TextStyle(
                            fontSize: 25.sp,
                            color: const Color(0xFFFF0000),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          "km/s",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 15.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          distance,
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          "метров",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 15.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Limit(dimension: 60,speed: speedLimit),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
