import 'package:antiradar/src/common/configurations/app_routes.dart';
import 'package:antiradar/src/ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';

import '../../ui/pages/home/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "AntiRadar",
      home: HomePage(),
    );
  }
}
