import 'package:antiradar/src/ui/pages/auth/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class ConfirmPage extends StatefulWidget {
  const ConfirmPage({Key? key}) : super(key: key);

  @override
  State<ConfirmPage> createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  static List<int?> number = [
    ...List.generate(10, (index) => index),
    null,
    0,
    null,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              // const SizedBox(height: 60),
              const Text(
                "T A S D I Q L A SH",
                style: TextStyle(
                  fontFamily: "TextFont",
                  fontSize: 23,
                  color: Color(0xFF34A853),
                ),
              ),
              // const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 90, right: 90),
                child: Divider(
                  height: 2,
                  color: Color(0xFFA027FF),
                ),
              ),

              // const SizedBox(height: 20),
              const Image(
                image: AssetImage("assets/images/confiroImages.png"),
                height: 200,
              ),

              Expanded(
                child: OtpPinField(
                  autoFillEnable: true,
                  onSubmit: (text) {},
                  onChange: (text) {},
                  showCustomKeyboard: true,
                  showDefaultKeyboard: false,
                  otpPinFieldInputType: OtpPinFieldInputType.password,
                  phoneNumbersHint: true,
                ),
              ),
              // Column(
              //   children: [
              //     for (int i = 1; i < number.length - 1; i += 3)
              //       Row(
              //         children: [
              //           for (int j = 0; j < 3; j++)
              //             ConfirmButton(
              //               number: number.elementAt(i + j),
              //               onTap: (digit) {},
              //             ),
              //         ],
              //       )
              //   ],
              // ),

              // const SizedBox(height: 100),
              SizedBox(
                height: 55,
                width: 340,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF34A853),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "T A S D I Q L A SH",
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
    );
  }
}
