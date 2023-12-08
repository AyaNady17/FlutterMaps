import 'package:flutter/material.dart';
import 'package:flutter_maps/Constansts/my_colors.dart';
import 'package:flutter_maps/Constansts/text_styles.dart';

String? phoneNumber;

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({super.key});

  String? PhoneNumber = phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
            decoration: BoxDecoration(
                border: Border.all(color: MyColors.blue),
                borderRadius: const BorderRadius.all(Radius.circular(6))),
            child: buildTextFormField()));
  }
}

Widget buildTextFormField() {
  return TextFormField(
    maxLength: 11,
    keyboardType: TextInputType.phone,
    autofocus: true,
    style: StylesManager.textStyle16
        .copyWith(letterSpacing: 2, color: Colors.black),
    decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Phone Number',
        hintStyle: StylesManager.textStyle14),
    validator: (value) {
      if (value == null) {
        return "please Enter your phone Number!";
      } else if (value.length < 11) {
        return "Too short for a phone number";
      }
      return null;
    },
    onSaved: (value) {
      phoneNumber = value;
    },
  );
}
