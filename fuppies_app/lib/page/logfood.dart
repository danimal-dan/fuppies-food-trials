import 'package:flutter/material.dart';

class LogFoodPage extends StatefulWidget {
  const LogFoodPage({Key? key}) : super(key: key);

  @override
  State<LogFoodPage> createState() => _LogFoodPageState();
}

class _LogFoodPageState extends State<LogFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log Food'),
      ),
      body: Center(
        child: Column(
          children: const <Widget>[
            Text('food name'),
            Text('date time'),
            Text('amount'),
          ],
        ),
      ),
    );
  }
}
