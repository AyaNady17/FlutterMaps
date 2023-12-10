import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/Bussines%20Logic/cubit/phoneAuthCubit/phone_auth_cubit.dart';
import 'package:flutter_maps/Constansts/strings.dart';
import 'package:flutter_maps/Presentaion/Screens/otp_screen.dart';
import 'package:flutter_maps/Presentaion/Widgets/custom_next_button.dart';
import 'package:flutter_maps/Presentaion/Widgets/custom_text_form_field.dart';
import 'package:flutter_maps/Presentaion/Widgets/intro_text.dart';
import 'package:flutter_maps/Presentaion/Widgets/phone_form_field.dart';
import 'package:flutter_maps/Presentaion/Widgets/show_indicator.dart';

class LoginScreenBody extends StatelessWidget {
  LoginScreenBody({super.key});
  final GlobalKey<FormState> _PhoneFormKey = GlobalKey();
  CustomTextFormField customTextFormField = CustomTextFormField();

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listener: (context, state) {
        if (state is PhoneAuthLoading) {
          showProgressIndicator(context);
        } else if (state is PhoneAuthNumberSubmitted) {
          Navigator.pop(context);
          //Not Sure
          Navigator.of(context)
              .pushNamed(otpScreen, arguments: customTextFormField.PhoneNumber);
        } else if (state is PhoneAuthFailure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errMsg),
            backgroundColor: Colors.black,
          ));
        }
      },
      child: Form(
          key: _PhoneFormKey,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 88, horizontal: 24),
            child: Column(
              children: [
                const IntroText(
                  title: "What's your phone number?",
                  subTitle:
                      "Please enter your phone number to verify your account",
                ),
                const SizedBox(height: 100),
                const PhoneFormField(),
                const SizedBox(height: 60),
                CustomNextButton(
                  title: 'Next',
                  onPressed: () {
                    showProgressIndicator(context);
                    register(context);
                  },
                ),
              ],
            ),
          )),
    );
  }

  void register(BuildContext context) {
    if (!_PhoneFormKey.currentState!.validate()) {
      Navigator.pop(context);
      return;
    } else {
      Navigator.pop(context);
      _PhoneFormKey.currentState!.save();
      BlocProvider.of<PhoneAuthCubit>(context)
          .submitPhoneNumber(customTextFormField.PhoneNumber!);
    }
  }
}
