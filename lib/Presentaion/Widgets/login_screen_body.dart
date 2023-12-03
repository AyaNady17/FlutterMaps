import 'package:flutter/material.dart';
import 'package:flutter_maps/Presentaion/Widgets/custom_next_button.dart';
import 'package:flutter_maps/Presentaion/Widgets/intro_text.dart';
import 'package:flutter_maps/Presentaion/Widgets/phone_form_field.dart';

class LoginScreenBody extends StatelessWidget {
  LoginScreenBody({super.key});
  final GlobalKey<FormState> _PhoneFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _PhoneFormKey,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 88, horizontal: 24),
          child: const Column(
            children: [
              IntroText(
                title: "What's your phone number?",
                subTitle:
                    "Please enter your phone number to verify your account",
              ),
              SizedBox(height: 100),
              PhoneFormField(),
              SizedBox(height: 60),
              CustomNextButton(title: 'Next'),
            ],
          ),
        ));
  }
}
