import 'package:flutter/material.dart';

import '../auth/register/register_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: const Color(0xFF34A853),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 130),
              const Text("YO'LDA",style: TextStyle(fontFamily: "TextFont",fontSize: 42,color: Colors.white),),
              const SizedBox(height: 10),
              const Text("XAFSIZ VA JARIMALARSIZ\n       HARAKATLANING",style: TextStyle(fontFamily: "TitleFont",fontSize: 16,color: Colors.white),),
              const SizedBox(height: 20),
              const Image(image: AssetImage("assets/images/yoldaImages.png"),height: 230,),
              const SizedBox(height: 90),
              SizedBox(
                height: 50,
                width: 350,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                  ),
                    onPressed: (){},
                    child: const Text("SAFARNI BOSHLANG",style: TextStyle(color: Color(0xFF34A853),fontFamily: "TextFont"),),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: 350,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFA027FF),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                  ),
                  onPressed: (){
                    Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context)=>RegisterPage())
                    );
                  },
                  child: const Text("RO'YHATDAN O'TISH",style: TextStyle(color: Colors.white,fontFamily: "TextFont"),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
