import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/Bussines%20Logic/cubit/phoneAuthCubit/phone_auth_cubit.dart';
import 'package:flutter_maps/Constansts/my_colors.dart';
import 'package:flutter_maps/Constansts/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            decoration: BoxDecoration(
                border: Border.all(color: MyColors.blue),
                borderRadius: const BorderRadius.all(Radius.circular(6))),
            child: const buildTextFormField()));
  }
}

class buildTextFormField extends StatelessWidget {
  const buildTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 11,
      keyboardType: TextInputType.number,
      //autofocus: true,
      style: StylesManager.textStyle14
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
        //saving the phone number to the cubit & state cause we cannot pass it back to the login page body
        BlocProvider.of<PhoneAuthCubit>(context).number = value!;
      },
    );
  }
}
