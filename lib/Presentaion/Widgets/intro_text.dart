import 'package:flutter/material.dart';
import 'package:flutter_maps/Constansts/text_styles.dart';

class IntroText extends StatelessWidget {
  const IntroText({super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: StylesManager.textStyle26,
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          subTitle,
          style: StylesManager.textStyle18,
        )
      ],
    );
  }
}
