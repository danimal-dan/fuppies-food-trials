import 'package:flutter/material.dart';
import 'package:fuppies_app/widget/food_list_dropdown.dart';

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
      body: Form(
        child: Center(
            child: Column(
          children: const <Widget>[
            FoodListDropdown(),
            Text('date time'),
            Text('amount'),
          ],
        )),
      ),
    );
  }
}
