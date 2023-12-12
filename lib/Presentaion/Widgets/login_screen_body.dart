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

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listenWhen: (current, previous) {
        return current != previous;
      },
      listener: (context, state) {
        if (state is PhoneAuthLoading) {
          showProgressIndicator(context);
        } else if (state is PhoneAuthNumberSubmitted) {
          Navigator.pop(context);
          //getting the phone number from the state
          Navigator.of(context)
              .pushNamed(otpScreen, arguments: state.phoneNumber);
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
            margin: const EdgeInsets.only(top: 88, right: 24, left: 24),
            child: Column(
              children: [
                const IntroText(
                  title: "What's your phone number?",
                  subTitle:
                      "Please enter your phone number to verify your account",
                ),
                const SizedBox(height: 60),
                const PhoneFormField(),
                const SizedBox(height: 30),
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
          .submitPhoneNumber(BlocProvider.of<PhoneAuthCubit>(context).number);
    }
  }
}
