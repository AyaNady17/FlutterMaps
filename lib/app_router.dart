import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/Bussines%20Logic/cubit/Map%20Cubit/Map_cubit.dart';
import 'package:flutter_maps/Bussines%20Logic/cubit/phoneAuthCubit/phone_auth_cubit.dart';
import 'package:flutter_maps/Constansts/strings.dart';
import 'package:flutter_maps/Data/repo/place_suggestion_repo.dart';
import 'package:flutter_maps/Presentaion/Screens/login_screen.dart';
import 'package:flutter_maps/Presentaion/Screens/map_screen.dart';
import 'package:flutter_maps/Presentaion/Screens/otp_screen.dart';

class AppRouter {
  PhoneAuthCubit? phoneAuthCubit;
  AppRouter() {
    phoneAuthCubit = PhoneAuthCubit();
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<PhoneAuthCubit>.value(
                  value: phoneAuthCubit!,
                  child: const LoginScreen(),
                ));
      case otpScreen:
        final phoneNumber = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => BlocProvider<PhoneAuthCubit>.value(
                  value: phoneAuthCubit!,
                  child: OTPScreen(phoneNumber: phoneNumber),
                ));

      case mapScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => MapCubit(MapsRepo()),
                  child: MapScreen(),
                ));
    }
  }
}
