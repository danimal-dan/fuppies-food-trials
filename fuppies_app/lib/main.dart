import 'package:flutter/material.dart';
import 'view/home.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const FuppiesHome(title: 'FPIES Food Trials'),
    );
  }
}
