import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/Bussines%20Logic/cubit/phoneAuthCubit/phone_auth_cubit.dart';

class MapScreen extends StatelessWidget {
  MapScreen({super.key});
  PhoneAuthCubit phoneAuthCubit = PhoneAuthCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PhoneAuthCubit>(
      create: (context) => phoneAuthCubit,
      child: ElevatedButton(
          onPressed: () {
            phoneAuthCubit.logOut();
          },
          child: const Text('logout')),
    );
  }
}
