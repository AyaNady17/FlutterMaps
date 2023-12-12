import 'package:flutter/material.dart';
import 'package:flutter_maps/Constansts/my_colors.dart';
import 'package:flutter_maps/Constansts/text_styles.dart';

class CountryLabelWidget extends StatelessWidget {
  const CountryLabelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          decoration: BoxDecoration(
              border: Border.all(color: MyColors.lightGrey),
              borderRadius: const BorderRadius.all(Radius.circular(6))),
          child: Center(
            child: Text(
              "${generateCountryFlag()}  +20",
              style: StylesManager.textStyle14
                  .copyWith(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
        ));
  }
}

String generateCountryFlag() {
  String countryCode = 'eg';
  String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
      (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
  return flag;
}
