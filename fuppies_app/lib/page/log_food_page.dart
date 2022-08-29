import 'package:flutter/material.dart';
import 'package:fuppies_app/model/food.dart';
import 'package:fuppies_app/model/food_log_entry.dart';
import 'package:fuppies_app/widget/food_list_dropdown.dart';
import 'package:fuppies_app/widget/date_time_input.dart';

class LogFoodPage extends StatefulWidget {
  const LogFoodPage({Key? key}) : super(key: key);

  @override
  State<LogFoodPage> createState() => _LogFoodPageState();
}

class _LogFoodPageState extends State<LogFoodPage> {
  static const SizedBox spacer = SizedBox(height: 10);

  final _formKey = GlobalKey();
  final _model = FoodLogEntry();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log Food'),
      ),
      body: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                FoodListDropdown(
                    defaultValue: _model.food,
                    onChanged: (Food? food) {
                      _model.food = food;
                    }),
                spacer,
                DateTimeInput(
                  defaultValue: _model.date,
                  onChanged: (DateTime? date) {
                    if (date == null) {
                      return;
                    }

                    _model.date = date;
                  },
                ),
                spacer,
                const Text('amount'),
                spacer,
                const Text('like/dislike'),
                spacer,
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16.0),
                    child: ElevatedButton(
                        onPressed: () {
                          debugPrint(_model.toString());
                        },
                        child: const Text('Save'))),
              ],
            ),
          )),
    );
  }
}
