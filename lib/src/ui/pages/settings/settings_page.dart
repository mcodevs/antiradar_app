import 'package:antiradar/src/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}
  int sign=110;
  int carKm=65;

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
               SizedBox(
                height: 80,
                width: 100,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: AppColors.greenColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Column(
                    children: [
                      Text("$carKm",style: const TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white),),
                      const Text("km/s",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 100,
                width: 100,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                      color: AppColors.redColor,
                      borderRadius: BorderRadius.all(Radius.circular(200))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(7),
                    child: SizedBox(
                      child: DecoratedBox(decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(199)),
                        color: Colors.white
                      ),
                        child: Center(child: Text("$sign",style: const TextStyle(fontSize: 35,fontWeight: FontWeight.bold),)),
                      ),
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
