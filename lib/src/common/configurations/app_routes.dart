import 'package:antiradar/src/ui/pages/auth/login/login_page.dart';
import 'package:antiradar/src/ui/pages/auth/register/register_page.dart';
import 'package:antiradar/src/ui/pages/intro/intro_page.dart';
import 'package:antiradar/src/ui/pages/map/map_screen.dart';
import 'package:flutter/material.dart';

abstract final class AppRoutes {
  static const String intro = "/intro";
  static const String login = "/login";
  static const String register = "/register";
  static const String map = "/map";

  static final Map<String,Widget Function(BuildContext context)> routes = {
    intro: (context) => const IntroPage(),
    login: (context) => const LoginPage(),
    register: (context) => const RegisterPage(),
    map: (context) => const MapScreen(),
  };
}