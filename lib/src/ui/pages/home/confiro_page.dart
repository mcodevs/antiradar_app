

import 'package:antiradar/src/ui/pages/home/widget/confiro_code.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../common/constants/app_colors.dart';
import '../auth/login/login_page.dart';

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

  void buttonPressed(String value1){
    if(value1 == "<"){
      pinController.delete();
    }else if(value1 == "x"){
      pinController.clear();
    }else{
      pinController.append(value1, 5);
    }
  }
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
    return  Scaffold(
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
              const SizedBox(height: 10),
              const Image(
                image: AssetImage("assets/images/confiroImages.png"),
                height: 200,
              ),
              const Text("Kirish kodini o'rnating"),
              const SizedBox(height: 5),
              Pinput(
                length: 5,
                controller: pinController,
                focusNode: focusNode,
                onSubmitted: (value1){
                  FocusScope.of(context).unfocus();
               },
                useNativeKeyboard: false,
                defaultPinTheme: defaultPinTheme,
                separatorBuilder: (index)=>const SizedBox(width: 8),
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
              Expanded(
                flex: 4,
                child: FractionallySizedBox(
                  alignment: Alignment.center,
                  widthFactor: 0.55,
                  heightFactor: 0.94,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: List.generate(
                      4,
                          (i) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          3,
                              (j) {
                            final index = i * 3 + j + 1;
                            final value = index <= 9
                            ? "$index" :index == 10 ? "x" : index == 11 ? "0" : "<";
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: ConfirmButton(
                                radius: 7,
                                onPressed: () =>buttonPressed(value),
                                size: 60,
                                child: Center(
                                  child: Text(
                                   value,
                                    style: const TextStyle(fontSize: 20,color: Colors.white),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
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
                          MaterialPageRoute(builder: (context) =>  const LoginPage()),
                        );
                      },
                      child: const Text(
                        "T A S D I Q L A SH",
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
