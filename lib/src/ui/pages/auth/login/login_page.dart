import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 60),
              const Text(
                "KIRISH",
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
                image: AssetImage("assets/images/loginImage.png"),
                height: 200,
              ),
              const SizedBox(height: 20),
              const SizedBox(
                height: 50,
                width: 335,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Telefon raqamingizni kiriting",
                    border: OutlineInputBorder(

                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
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
