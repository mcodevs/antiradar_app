import 'package:flutter/material.dart';

import '../../intro/confirm_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 60),
                const Text(
                  "R O' Y H A T D A N  O' T I SH",
                  style: TextStyle(
                      fontFamily: "TextFont",
                      fontSize: 23,
                      color: Color(0xFF34A853)),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.only(left: 70, right: 70),
                  child: Divider(
                    height: 2,
                    color: Color(0xFFA027FF),
                  ),
                ),
                const SizedBox(height: 20),
                const Image(
                  image: AssetImage("assets/images/registerImage.png"),
                  height: 300,
                ),
                const SizedBox(height: 10),
                const SizedBox(
                  height: 50,
                  width: 355,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Ismingiz va familiyangizni kiriting",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                const SizedBox(
                  height: 50,
                  width: 355,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Avtomashina raqamini kiriting",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                const SizedBox(
                  height: 50,
                  width: 355,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Telefon raqamizni kiriting",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                SizedBox(
                  height: 55,
                  width: 340,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF34A853),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ConfirmPage()));
                    },
                    child: const Text(
                      "K E Y I N N G I",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "TextFont",
                          fontSize: 18,),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
