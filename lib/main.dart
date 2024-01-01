import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/Bussines%20Logic/cubit/Map%20Cubit/Map_cubit.dart';
import 'package:flutter_maps/Constansts/strings.dart';
import 'package:flutter_maps/Data/repo/place_suggestion_repo.dart';
import 'package:flutter_maps/Presentaion/Screens/map_screen.dart';
import 'package:flutter_maps/app_router.dart';
import 'package:flutter_maps/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(FlutterMaps(
    appRouter: AppRouter(),
  ));
}

class FlutterMaps extends StatelessWidget {
  const FlutterMaps({super.key, required this.appRouter});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Maps',
      theme: ThemeData(primarySwatch: Colors.blue),
      //  onGenerateRoute: appRouter.generateRoute,
      home: BlocProvider<MapCubit>(
        create: (context) => MapCubit(MapsRepo()),
        child: MapScreen(),
      ),
    );
  }
}
