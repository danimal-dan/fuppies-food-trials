import 'package:flutter/material.dart';
import 'package:fuppies_app/http/log_food_controller.dart';
import 'package:fuppies_app/model/food.dart';
import 'package:fuppies_app/model/food_log_entry.dart';
import 'package:fuppies_app/model/food_reaction.dart';
import 'package:fuppies_app/model/volume_unit.dart';
import 'package:fuppies_app/util/snack_bar_util.dart';
import 'package:fuppies_app/view/home.dart';
import 'package:fuppies_app/widget/default_elevated_button.dart';
import 'package:fuppies_app/widget/default_page_container.dart';
import 'package:fuppies_app/widget/food_list_dropdown.dart';
import 'package:fuppies_app/widget/date_time_input.dart';
import 'package:fuppies_app/widget/food_reaction_choice_chip.dart';
import 'package:fuppies_app/widget/ui_constants.dart' as constants;

class LogFoodPage extends StatefulWidget {
  const LogFoodPage({Key? key}) : super(key: key);

  @override
  State<LogFoodPage> createState() => _LogFoodPageState();
}

class _LogFoodPageState extends State<LogFoodPage> {
  final _formKey = GlobalKey();
  FoodLogEntry _model = FoodLogEntry();
  bool _isSaving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log Food'),
      ),
      body: Form(
          key: _formKey,
          child: DefaultPageContainer(
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
                constants.defaultVerticalSpacer,
                DateTimeInput(
                  defaultValue: _model.date,
                  onChanged: (DateTime? date) {
                    setState(() {
                      _model.date = date ?? DateTime.now();
                    });
                  },
                ),
                constants.defaultVerticalSpacer,
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
                constants.defaultVerticalSpacer,
                Flexible(
                    child: FoodReactionChoiceChip(
                        defaultValue: _model.reaction,
                        onChanged: (FoodReaction? reaction) {
                          setState(() {
                            _model.reaction = reaction;
                          });
                        })),
                constants.defaultVerticalSpacer,
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 16.0),
                    child: DefaultElevatedButton(
                        style: DefaultElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(16.0)),
                        onPressed: () async {
                          setState(() {
                            _isSaving = true;
                          });

                          try {
                            var response =
                                await LogFoodController().create(_model);
                            setState(() {
                              _model = response;
                            });
                          } catch (e) {
                            SnackBarUtil.showError(context,
                                'An error occurred while saving this food entry.');

                            return;
                          } finally {
                            setState(() {
                              _isSaving = false;
                            });
                          }

                          if (mounted) {
                            SnackBarUtil.showSuccess(
                                context, 'Food entry saved!');

                            _goToHome(context);
                          }
                        },
                        child: _isSaving
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2.0,
                              )
                            : const Text('Save'))),
              ],
            ),
          )),
    );
  }

  void _goToHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const FuppiesHome()),
    );
  }
}
