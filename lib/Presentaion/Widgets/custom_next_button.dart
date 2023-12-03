import 'package:flutter/material.dart';
import 'package:flutter_maps/Constansts/strings.dart';
import 'package:flutter_maps/Constansts/text_styles.dart';

class CustomNextButton extends StatelessWidget {
  const CustomNextButton({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, otpScreen);
        },
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            minimumSize: const Size(110, 50),
            backgroundColor: Colors.black),
        child: Text(
          title,
          style: StylesManager.textStyle16.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
