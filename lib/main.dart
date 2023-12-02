import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterMaps());
}

class FlutterMaps extends StatelessWidget {
  const FlutterMaps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Maps',
      theme: ThemeData(
       primarySwatch: Colors.blue
      ),
      onGenerateRoute: ,
    );
  }
}

