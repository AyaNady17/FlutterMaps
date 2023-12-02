import 'package:flutter/material.dart';
import 'package:flutter_maps/Constansts/text_styles.dart';

class IntroText extends StatelessWidget {
  const IntroText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "What's your phone number?",
          style: StylesManager.textStyle26,
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          "Please enter your phone number to verify your account",
          style: StylesManager.textStyle18,
        )
      ],
    );
  }
}
