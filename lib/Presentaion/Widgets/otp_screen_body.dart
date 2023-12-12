import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/Bussines%20Logic/cubit/phoneAuthCubit/phone_auth_cubit.dart';
import 'package:flutter_maps/Constansts/strings.dart';
import 'package:flutter_maps/Constansts/text_styles.dart';
import 'package:flutter_maps/Presentaion/Widgets/custom_next_button.dart';
import 'package:flutter_maps/Presentaion/Widgets/intro_text.dart';
import 'package:flutter_maps/Presentaion/Widgets/pin_code_widget.dart';
import 'package:flutter_maps/Presentaion/Widgets/show_indicator.dart';

class OTPScreenBody extends StatelessWidget {
  OTPScreenBody({super.key});
  late String otpCode;

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listenWhen: (current, previous) {
        return current != previous;
      },
      listener: (context, state) {
        if (state is PhoneAuthLoading) {
          showProgressIndicator(context);
        } else if (state is PhoneAuthNumberOTPVerified) {
          Navigator.pop(context);
          //getting the phone number from the state
          Navigator.of(context).pushReplacementNamed(mapScreen);
        } else if (state is PhoneAuthFailure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errMsg),
            backgroundColor: Colors.black,
          ));
        }
      },
      child: Container(
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
            const SizedBox(height: 60),
            PinCode(
              onCompleted: (value) {
                otpCode = value;
              },
            ),
            const SizedBox(height: 30),
            CustomNextButton(
              title: 'Verify',
              onPressed: () {
                //login user
                BlocProvider.of<PhoneAuthCubit>(context).submitOTP(otpCode);
              },
            ),
          ],
        ),
      ),
    );
  }
}
