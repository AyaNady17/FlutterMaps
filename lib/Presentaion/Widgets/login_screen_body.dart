import 'package:flutter/material.dart';
import 'package:flutter_maps/Presentaion/Widgets/custom_next_button.dart';
import 'package:flutter_maps/Presentaion/Widgets/intro_text.dart';
import 'package:flutter_maps/Presentaion/Widgets/phone_form_field.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Container(
      margin: const EdgeInsets.symmetric(vertical: 88, horizontal: 24),
      child: const Column(
        children: [
          IntroText(),
          SizedBox(height: 100),
          PhoneFormField(),
          SizedBox(height: 60),
          CustomNextButton(),
        ],
      ),
    ));
  }
}
