import 'package:antiradar/src/ui/pages/home/places_page/widget/places_widget.dart';
import 'package:antiradar/src/ui/pages/home/places_page_two/places_two.dart';
import 'package:flutter/material.dart';

import '../../../../common/constants/app_colors.dart';

class PagePlaces extends StatefulWidget {
  const PagePlaces({Key? key,required this.index}) : super(key: key);
  final int index;

  @override
  State<PagePlaces> createState() => _PagePlacesState();
}

class _PagePlacesState extends State<PagePlaces> {
  double distanc=232;
  String workingTime="24/7";
  String text="Oldinda";

  @override
  Widget build(BuildContext context) {
   return   Scaffold(
     resizeToAvoidBottomInset: false,
    body: Center(
      child: Column(
        children: [
          const SizedBox(height: 40),
          const Text(
            "J O Y L A R",
            style: TextStyle(
              fontFamily: "TextFont",
              fontSize: 23,
              color: AppColors.greenColor,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 90, right: 90),
            child: Divider(
              height: 2,
              color: AppColors.purpleColor,
            ),
          ),
          const SizedBox(height: 15),
          const SizedBox(
            height: 50,
            width: 345,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Qidirish",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))
                )
              ),
            ),
          ),
          const SizedBox(height: 20),
          CustomInfoCard(
            distance: distanc,
            workingTime: workingTime,
            text: text,
            placeName: nameText[widget.index],
          ),
          const SizedBox(height: 10),
          CustomInfoCard(
            distance: distanc,
            workingTime: workingTime,
            text: text,
            placeName: nameText[widget.index],
          ),
          const SizedBox(height: 10),
          CustomInfoCard(
            distance: distanc,
            workingTime: workingTime,
            text: text,
            placeName: nameText[widget.index],
          ),
          const SizedBox(height: 60),
          SizedBox(
            height: 45,
            width: 130,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                  backgroundColor: const Color(0xFF325AE4)
              ),
              onPressed:(){
                Navigator.pop(context);
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(image: AssetImage("assets/images/image 16 (1).png"),height: 30,),
                  Text("ORTGA",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          )
        ],
      ),
    ),
   );
  }
}
