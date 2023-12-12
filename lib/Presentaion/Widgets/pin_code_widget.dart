import 'package:flutter/material.dart';
import 'package:flutter_maps/Constansts/my_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCode extends StatelessWidget {
  const PinCode({super.key, required this.onCompleted});
  final Function(String)? onCompleted;
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      onCompleted: onCompleted,
      keyboardType: TextInputType.phone,
      cursorColor: Colors.black,
      appContext: context,
      length: 6,
      autoFocus: true,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          activeFillColor: MyColors.lightBlue,
          inactiveFillColor: Colors.white,
          activeColor: MyColors.lightBlue,
          inactiveColor: MyColors.lightGrey,
          selectedFillColor: Colors.white),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      enableActiveFill: true,
    );
  }
}
