import 'package:antiradar/src/common/configurations/app_routes.dart';
import 'package:antiradar/src/ui/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  const Header(text: "Ro'yhatdan o'tish"),
                  const SizedBox(height: 10),
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
                  SizedBox(
                    height: 50,
                    width: 355,
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        MaskTextInputFormatter(
                          mask: '+998 (##) ###-##-##',
                          filter: {
                            "#": RegExp(r'[0-9]'),
                          },
                        ),
                      ],
                      decoration: const InputDecoration(
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
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRoutes.map,
                          (route) => false,
                        );
                      },
                      child: const Text(
                        "K E Y I N G I",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "TextFont",
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
