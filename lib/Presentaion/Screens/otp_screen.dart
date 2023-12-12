import 'package:flutter/material.dart';
import 'package:flutter_maps/Presentaion/Widgets/otp_screen_body.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key, this.phoneNumber});
  final phoneNumber;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: OTPScreenBody(),
      ),
    );
  }
}
