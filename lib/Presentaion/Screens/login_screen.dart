import 'package:flutter/material.dart';
import 'package:flutter_maps/Constansts/my_colors.dart';
import 'package:flutter_maps/Constansts/text_styles.dart';
import 'package:flutter_maps/Presentaion/Widgets/login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(backgroundColor: Colors.white, body: LoginScreenBody()),
    );
  }
}
