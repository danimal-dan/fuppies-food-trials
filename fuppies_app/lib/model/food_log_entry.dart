import 'package:fuppies_app/model/food.dart';
import 'package:fuppies_app/model/food_reaction.dart';
import 'package:fuppies_app/model/volume_unit.dart';

class FoodLogEntry {
  Food? food;
  DateTime date = DateTime.now();
  double volumeAmount = 0;
  VolumeUnit volumeUnit = VolumeUnit.teaspoon;
  FoodReaction? reaction;

  @override
  String toString() {
    return "{Food: ${food?.displayName}, Date: $date, Volume: $volumeAmount ${volumeUnit.abbreviation}}, Reaction: ${reaction?.displayName}";
  }
}
