import 'food.dart';
import 'food_reaction.dart';
import 'volume_unit.dart';

class FoodLogEntry {
  Food? food;
  DateTime date = DateTime.now();
  double volumeAmount = 0;
  VolumeUnit volumeUnit = VolumeUnit.teaspoon;
  FoodReaction? reaction;

  FoodLogEntry.fromJson(Map<String, dynamic> json)
      : food = Food.fromJson(json['food']),
        date = DateTime.parse(json['date']),
        volumeAmount = json['volumeAmount'],
        volumeUnit =
            VolumeUnit.fromJson(json['volumeUnit']) ?? VolumeUnit.teaspoon,
        reaction = FoodReaction.fromJson(json['reaction']);

  Map<String, dynamic> toJson() => {
        'food': food,
        'date': date.toIso8601String(),
        'volumeAmount': volumeAmount,
        'volumeUnit': volumeUnit,
        'reaction': reaction,
      };

  @override
  String toString() {
    return "{Food: ${food?.displayName}, Date: $date, Volume: $volumeAmount ${volumeUnit.abbreviation}}, Reaction: ${reaction?.displayName}";
  }
}
