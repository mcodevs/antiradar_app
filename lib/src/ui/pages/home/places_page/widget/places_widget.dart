
import 'package:flutter/material.dart';

import '../../../../../common/constants/app_colors.dart';

class CustomInfoCard extends StatelessWidget {
  final double distance;
  final String workingTime;
  final String text;
  final String placeName;

  const CustomInfoCard({
    Key? key,
    required this.distance,
    required this.workingTime,
    required this.text,
    required this.placeName
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
          height: 170,
          width: 370,
          child: Card(
            color: AppColors.whiteColor,
            shape: const RoundedRectangleBorder(
              side: BorderSide(color: AppColors.blackColor,width: 2),
              borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Center(child: Text(placeName,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Color(0xFF1BE117)),)),
                  const Divider(height: 2,color: AppColors.blackColor,),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const  Text("Xolati : ",
                        style: TextStyle(
                          fontSize: 16,fontWeight: FontWeight.bold
                        ),
                      ),
                      const Text("Oldinda",
                        style: TextStyle(
                            fontSize: 16,fontWeight: FontWeight.bold,color: Color(0xFF1BE117),
                        ),
                      ),
                      const SizedBox(width: 70),
                      const Text(
                        'Masofa : ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '$distance metr',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(
                    'Ish Vaqti : $workingTime',
                    style: const TextStyle(
                      fontSize: 16,fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 30,
                        width: 150,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1BE117),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(6))
                            ),
                          ),
                          onPressed: () {

                          },
                          child: const Text("Qo'ng'iroq",style: TextStyle(color: AppColors.whiteColor),),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: 150,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.blueColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(6))
                            ),
                          ),
                          onPressed: () {

                          },
                          child: const Text("Marshrut",style: TextStyle(color: AppColors.whiteColor),),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
