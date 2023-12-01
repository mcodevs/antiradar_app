import 'package:antiradar/src/common/constants/app_colors.dart';
import 'package:antiradar/src/ui/pages/home/widget/confiro_code.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../settings/settings_page.dart';

class LoginPage extends StatefulWidget {
   LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();


  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  final TextEditingController phonController=TextEditingController();

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
                    color: AppColors.greenColor),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.only(left: 90, right: 90),
                child: Divider(
                  height: 2,
                  color: AppColors.purpleColor,
                ),
              ),
              const SizedBox(height: 20),
              const Image(
                image: AssetImage("assets/images/loginImage.png"),
                height: 160,
              ),
              const SizedBox(height: 20),
                SizedBox(
                height: 50,
                width: 335,
                child: TextField(
                  controller: phonController,
                  decoration: const InputDecoration(
                    hintText: "Telefon raqamingizni kiriting",
                    border: OutlineInputBorder(

                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text("Kirish kodini kiriting"),
              const SizedBox(height: 5),
              Pinput(
                controller: pinController,
                focusNode: focusNode,
                androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
                listenForMultipleSmsOnAndroid: true,
                defaultPinTheme: defaultPinTheme,
                separatorBuilder: (index) => const SizedBox(width: 8),
                validator: (value) {
                  return value == '2222' ? null : "PIN-code error";
                },
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onCompleted: (pin) {
                  debugPrint('onCompleted: $pin');
                },
                onChanged: (value) {
                  debugPrint('onChanged: $value');
                },
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 9),
                      width: 22,
                      height: 1,
                      color: Colors.black,
                    ),
                  ],
                ),
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black),
                  ),
                ),
                submittedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    color: fillColor,
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(color: Colors.black),
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyBorderWith(
                  border: Border.all(color: Colors.redAccent),
                ),
              ),
              const ConfiroButton(),
              const SizedBox(height: 40),
              LayoutBuilder(
                builder: (context, constraints) {
                  return SizedBox(
                    height: constraints.maxWidth <= 600 ? 50 : 55,
                    width: constraints.maxWidth <= 340 ? double.infinity : 340,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.greenColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>const SettingsPage()),
                        );
                      },
                      child: const Text(
                        "K E Y I N G I",
                        style:
                        TextStyle(color: Colors.white, fontFamily: "TextFont", fontSize: 18),
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
