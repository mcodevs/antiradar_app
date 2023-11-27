
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YandexMap(),
    );
  }
}
