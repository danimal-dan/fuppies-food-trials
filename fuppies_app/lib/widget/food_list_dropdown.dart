import 'package:flutter/material.dart';
import 'package:fuppies_app/model/food.dart';

class FoodListDropdown extends StatefulWidget {
  const FoodListDropdown({Key? key}) : super(key: key);

  @override
  State<FoodListDropdown> createState() => _FoodListDropdown();
}

class _FoodListDropdown extends State<FoodListDropdown> {
  Food? selectedFood;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: selectedFood,
        onChanged: (Food? newValue) {
          setState(() {
            selectedFood = newValue;
          });
        },
        items: Food.values
            .map<DropdownMenuItem<Food>>((Food value) =>
                DropdownMenuItem(value: value, child: Text(value.displayName)))
            .toList());
  }
}
