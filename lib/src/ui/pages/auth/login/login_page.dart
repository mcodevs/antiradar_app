import 'package:antiradar/src/common/configurations/app_routes.dart';
import 'package:antiradar/src/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../widgets/custom_pinput.dart';
import '../widgets/custom_calculate_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  void onButtonPressed(String value) {
    if (value == "<") {
      pinController.delete();
    } else if (value == "x") {
      pinController.clear();
    } else {
      pinController.append(value, 5);
    }
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    final defaultPinTheme = PinTheme(
      width: 45,
      height: 45,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Text(
                "KIRISH",
                style: TextStyle(
                  fontFamily: "TextFont",
                  fontSize: 23,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 90, right: 90),
                child: Divider(
                  height: 2,
                  color: AppColors.secondary,
                ),
              ),
              const Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage("assets/images/loginImage.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 335,
                child: TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    hintText: "Telefon raqamingizni kiriting",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text("Kirish kodini kiriting"),
              const SizedBox(height: 5),
              CustomPinPut(
                pinController: pinController,
                focusNode: focusNode,
                defaultPinTheme: defaultPinTheme,
                fillColor: fillColor,
              ),
              CustomCalculateButton(
                onButtonPressed: (value) => onButtonPressed(value),
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  return SizedBox(
                    height: constraints.maxWidth <= 600 ? 50 : 55,
                    width: constraints.maxWidth <= 340 ? double.infinity : 340,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
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
                            fontSize: 18),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
