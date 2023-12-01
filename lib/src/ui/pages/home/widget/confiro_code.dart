import 'package:flutter/material.dart';

import '../../../../common/constants/app_colors.dart';

class ConfiroButton extends StatefulWidget {
  const ConfiroButton({Key? key}) : super(key: key);

  @override
  State<ConfiroButton> createState() => _ConfiroButtonState();
}

List<String> number1 = ["1", "2", "3"];
List<String> number2 = ["4", "5", "6"];
List<String> number3 = ["7", "8", "9"];
List<String> number4 = ["x", "0", "<"];

class _ConfiroButtonState extends State<ConfiroButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i <= 2; i++)
                SizedBox(
                  height: 53,
                  width: 53,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.greenColor,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5),),),),
                      onPressed: () {},
                      child: Text(
                        number1[i],
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      )),
                ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i <= 2; i++)
                SizedBox(
                  height: 53,
                  width: 53,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.greenColor,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5),),),),
                      onPressed: () {},
                      child: Text(number2[i],
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),),),
                ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i <= 2; i++)
                SizedBox(
                  height: 53,
                  width: 53,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.greenColor,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5),),),),
                      onPressed: () {},
                      child: Text(number3[i],
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white))),
                )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i <= 2; i++)
                SizedBox(
                  height: 53,
                  width: 53,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.greenColor,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)))),
                      onPressed: () {},
                      child: Text(number4[i],style: const TextStyle(
                          fontSize: 20, color: Colors.white))),
                )
            ],
          ),
        ],
      ),
    );
  }
}
