import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

void showProgressIndicator(BuildContext context) {
  AlertDialog alertDialog = AlertDialog(
    content: Center(child: Lottie.asset('assets/loading.json')),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
  showDialog(
    context: context,
    builder: (context) => alertDialog,
    barrierDismissible: false,
  );
}
