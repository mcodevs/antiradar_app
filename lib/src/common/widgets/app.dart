import 'package:antiradar/src/ui/map/map_screen.dart';
import 'package:antiradar/src/ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Yo'lda",
      home: MapScreen(),
    );
  }
}
