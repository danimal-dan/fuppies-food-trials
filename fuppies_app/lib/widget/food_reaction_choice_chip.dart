import 'package:flutter/material.dart';
import 'package:fuppies_app/model/food_reaction.dart';

class FoodReactionChoiceChip extends StatefulWidget {
  final FoodReaction? defaultValue;
  final void Function(FoodReaction?)? onChanged;

  const FoodReactionChoiceChip({Key? key, this.defaultValue, this.onChanged})
      : super(key: key);

  @override
  State<FoodReactionChoiceChip> createState() => _FoodReactionChoiceChip();
}

class _FoodReactionChoiceChip extends State<FoodReactionChoiceChip> {
  FoodReaction? selectedReaction;

  @override
  void initState() {
    super.initState();
    selectedReaction = widget.defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      key: Key(selectedReaction.toString()),
      value: selectedReaction,
      onChanged: (FoodReaction? newValue) {
        setState(() {
          selectedReaction = newValue;
        });

        widget.onChanged?.call(newValue);
      },
      items: FoodReaction.values
          .map<DropdownMenuItem<FoodReaction>>((FoodReaction value) =>
              DropdownMenuItem(value: value, child: Text(value.displayName)))
          .toList(),
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Reaction',
        contentPadding: EdgeInsets.all(0.0),
      ),
    );
  }
}
