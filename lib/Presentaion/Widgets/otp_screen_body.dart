import 'package:flutter/material.dart';
import 'package:flutter_maps/Constansts/text_styles.dart';
import 'package:flutter_maps/Presentaion/Widgets/custom_next_button.dart';
import 'package:flutter_maps/Presentaion/Widgets/intro_text.dart';
import 'package:flutter_maps/Presentaion/Widgets/pin_code_widget.dart';

class OTPScreenBody extends StatelessWidget {
  const OTPScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 88, horizontal: 24),
      child: Column(
        children: [
          const IntroText(
              title: 'Verify your phone number',
              subTitle: 'Enter your 6 digit code numbers sent to '),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              '  +20 01119404584',
              style: StylesManager.textStyle18.copyWith(color: Colors.blue),
            ),
          ),
          const SizedBox(height: 100),
          const PinCode(),
          const SizedBox(height: 60),
          const CustomNextButton(
            title: 'Verify',
          ),
        ],
      ),
    );
  }
}
