import 'package:flutter/material.dart';
import 'package:fuppies_app/model/food.dart';
import 'package:fuppies_app/model/food_log_entry.dart';
import 'package:fuppies_app/model/food_reaction.dart';
import 'package:fuppies_app/model/volume_unit.dart';
import 'package:fuppies_app/widget/food_list_dropdown.dart';
import 'package:fuppies_app/widget/date_time_input.dart';
import 'package:fuppies_app/widget/food_reaction_choice_chip.dart';

class LogFoodPage extends StatefulWidget {
  const LogFoodPage({Key? key}) : super(key: key);

  @override
  State<LogFoodPage> createState() => _LogFoodPageState();
}

class _LogFoodPageState extends State<LogFoodPage> {
  static const SizedBox spacer = SizedBox(height: 24.0);

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
                Flexible(
                    child: FoodListDropdown(
                        defaultValue: _model.food,
                        onChanged: (Food? food) {
                          setState(() {
                            _model.food = food;
                          });
                        })),
                spacer,
                DateTimeInput(
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
                    Expanded(
                        flex: 2,
                        child: TextFormField(
                          initialValue: _model.volumeAmount.toString(),
                          keyboardType: TextInputType.number,
                          onChanged: (String? amount) {
                            setState(() {
                              _model.volumeAmount =
                                  double.tryParse(amount ?? '')?.toDouble() ??
                                      0.0;
                            });
                          },
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Amount',
                            contentPadding: EdgeInsets.all(0.0),
                          ),
                        )),
                    Flexible(
                        child: DropdownButtonFormField(
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
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Unit',
                        contentPadding: EdgeInsets.all(0.0),
                      ),
                    ))
                  ],
                ),
                spacer,
                Flexible(
                    child: FoodReactionChoiceChip(
                        defaultValue: _model.reaction,
                        onChanged: (FoodReaction? reaction) {
                          setState(() {
                            _model.reaction = reaction;
                          });
                        })),
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
