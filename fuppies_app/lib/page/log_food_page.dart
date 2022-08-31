import 'package:flutter/material.dart';
import 'package:fuppies_app/model/food.dart';
import 'package:fuppies_app/model/food_log_entry.dart';
import 'package:fuppies_app/model/volume_unit.dart';
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
                    key: Key(_model.food.toString()),
                    defaultValue: _model.food,
                    onChanged: (Food? food) {
                      setState(() {
                        _model.food = food;
                      });
                    }),
                spacer,
                DateTimeInput(
                  key: Key(_model.date.millisecondsSinceEpoch.toString()),
                  defaultValue: _model.date,
                  onChanged: (DateTime? date) {
                    setState(() {
                      _model.date = date ?? DateTime.now();
                    });
                  },
                ),
                spacer,
                Row(
                  children: <Widget>[
                    Flexible(
                        child: TextFormField(
                      key: Key(_model.volumeAmount.toString()),
                      initialValue: _model.volumeAmount.toString(),
                      keyboardType: TextInputType.number,
                    )),
                    DropdownButton(
                      key: Key(_model.volumeUnit.abbreviation),
                      value: _model.volumeUnit,
                      items: VolumeUnit.values
                          .map((unit) => DropdownMenuItem(
                                value: unit,
                                child: Text(unit.abbreviation),
                              ))
                          .toList(),
                      onChanged: (VolumeUnit? unit) {
                        setState(() {
                          if (unit != null) {
                            _model.volumeUnit = unit;
                          }
                        });
                      },
                    )
                  ],
                ),
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
