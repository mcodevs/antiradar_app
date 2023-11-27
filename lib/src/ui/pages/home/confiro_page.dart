
import 'package:antiradar/src/ui/pages/auth/login/login_page.dart';
import 'package:antiradar/src/ui/pages/home/widget/confiro_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class ConfiroPage extends StatelessWidget {
  const ConfiroPage({Key? key}) : super(key: key);


  static List<int?>number=[
    ...List.generate(10, (index) => index),
    null,0,null,
  ];

  final TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 60),
              const Text(
                "TASDIQLASH",
                style: TextStyle(
                    fontFamily: "TextFont",
                    fontSize: 23,
                    color: Color(0xFF34A853)),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 90, right: 90),
                child: Divider(
                  height: 2,
                  color: Color(0xFFA027FF),
                ),
              ),
              const SizedBox(height: 20),
              const Image(
                image: AssetImage("assets/images/confiroImages.png"),
                height: 200,
              ),
              SizedBox(
                height: 50,
                child: OtpTextField(
                  handleControllers: (controllers) {

                  },
                  numberOfFields: 5,
                  cursorColor: Colors.black,
                  focusedBorderColor: Colors.black,
                  enabledBorderColor: Colors.grey.shade400,
                  showFieldAsBox: true,
                  onCodeChanged: (String code){

                  },
                  onSubmit: (String numberCode){
                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        title: const Text("jasur"),
                        content: Text("code $numberCode"),
                      );
                    });
                  },
                ),
              ),
               Column(
                children: [
                  for(int i=1; i<number.length-1; i+=3)
                   Row(
                     children: [
                       for(int j=0;j<3; j++)
                         ConfiroButton(number: null,),
                     ],
                   )
                ],
              ),
              const SizedBox(height: 100),
              SizedBox(
                height: 55,
                width: 340,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF34A853),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                  ),
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>const LoginPage())
                    );
                  },
                  child: const Text("T A S D I Q L A SH",style: TextStyle(color: Colors.white,fontFamily: "TextFont",fontSize: 18),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
