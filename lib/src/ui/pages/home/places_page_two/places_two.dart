import 'package:antiradar/src/ui/pages/home/places_page_two/widget/places_two_widget.dart';
import 'package:flutter/material.dart';
import '../../../../common/constants/app_colors.dart';
import '../places_page/places_one_pages.dart';

class PlacesPageTwo extends StatefulWidget {
  const PlacesPageTwo({
    Key? key,
  }) : super(key: key);

  @override
  State<PlacesPageTwo> createState() => _PlacesPageTwoState();
}

List<String> nameText = [
  "Kafe va restoran",
  "Avto yuvish",
  "Vulkanizatsia",
  "Metan zapravkalar",
  "Propan zapravkalar",
  "Benzin zapravkalar",
  "Solyarka zapravkalar",
  "TIR parklar",
  "Pullik parkovka",
  "Kofe",
];

class _PlacesPageTwoState extends State<PlacesPageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            const SizedBox(height: 20),
            Column(
              children: List.generate(
                  nameText.length,
                  (index) => Padding(
                    padding:  const EdgeInsets.all(1),
                    child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>PagePlaces(index: index,)));
                          },
                          child: PlacesTwoWidget(
                            child: Center(child: Text(nameText[index],style: const TextStyle(fontSize: 18),)),
                          ),
                        ),
                  ),
              ),
            ),
            const SizedBox(height: 25),
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
