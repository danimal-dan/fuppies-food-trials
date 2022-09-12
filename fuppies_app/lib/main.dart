import 'package:flutter/material.dart';
import 'package:fuppies_app/view/login.dart';
import 'package:fuppies_app/widget/ui_constants.dart' as constants;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FPIES Food Trials',
      theme: ThemeData(
          primarySwatch: constants.primarySwatch,
          backgroundColor: constants.white,
          appBarTheme: const AppBarTheme(foregroundColor: constants.white)),
      home: const LoginPage(),
    );
  }
}
