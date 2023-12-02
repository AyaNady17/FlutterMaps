import 'package:flutter/material.dart';
import 'package:flutter_maps/Constansts/strings.dart';
import 'package:flutter_maps/Presentaion/Screens/login_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
