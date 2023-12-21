import 'package:antiradar/src/common/constants/app_colors.dart';
import 'package:antiradar/src/ui/pages/auth/login/login_page.dart';
import 'package:antiradar/src/ui/pages/auth/widgets/custom_pinput.dart';
import 'package:antiradar/src/ui/pages/auth/widgets/custom_calculate_button.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class ConfirmPage extends StatefulWidget {
  const ConfirmPage({Key? key}) : super(key: key);

  @override
  State<ConfirmPage> createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void buttonPressed(String value1) {
    if (value1 == "<") {
      pinController.delete();
    } else if (value1 == "x") {
      pinController.clear();
    } else {
      pinController.append(value1, 5);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text(
                "TASDIQLASH",
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
              const SizedBox(height: 10),
              const Image(
                image: AssetImage("assets/images/confiroImages.png"),
                height: 200,
              ),
              const Text("Kirish kodini o'rnating"),
              const SizedBox(height: 5),
              CustomPinPut(
                pinController: pinController,
                focusNode: focusNode,
              ),
              CustomCalculateButton(
                onButtonPressed: (value) => buttonPressed(value),
              ),
              const SizedBox(height: 50),
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
                            fontSize: 18),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
