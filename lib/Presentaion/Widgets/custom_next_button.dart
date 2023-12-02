import 'package:flutter/material.dart';
import 'package:flutter_maps/Constansts/text_styles.dart';

class CustomNextButton extends StatelessWidget {
  const CustomNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            minimumSize: const Size(110, 50),
            backgroundColor: Colors.black),
        child: Text(
          "Next",
          style: StylesManager.textStyle16.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
