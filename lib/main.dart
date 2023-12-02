import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      title: 'Flutter Maps',
      theme: ThemeData(primarySwatch: Colors.blue),
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
