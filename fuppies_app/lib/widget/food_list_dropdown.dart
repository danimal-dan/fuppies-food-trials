import 'package:flutter/material.dart';
import 'package:fuppies_app/model/food.dart';

class FoodListDropdown extends StatefulWidget {
  final Food? defaultValue;
  final void Function(Food?)? onChanged;

  const FoodListDropdown({Key? key, this.defaultValue, this.onChanged})
      : super(key: key);

  @override
  State<FoodListDropdown> createState() => _FoodListDropdown();
}

class _FoodListDropdown extends State<FoodListDropdown> {
  Food? selectedFood;

  @override
  void initState() {
    super.initState();
    selectedFood = widget.defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      key: Key(selectedFood.toString()),
      value: selectedFood,
      onChanged: (Food? newValue) {
        setState(() {
          selectedFood = newValue;
        });

        widget.onChanged?.call(newValue);
      },
      items: Food.values
          .map<DropdownMenuItem<Food>>((Food value) =>
              DropdownMenuItem(value: value, child: Text(value.displayName)))
          .toList(),
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Food',
        contentPadding: EdgeInsets.all(0.0),
      ),
    );
  }
}
