import 'package:recase/recase.dart';

enum Food {
  avocado("Avocado"),
  blueberries("Blueberries"),
  oats("Oats"),
  pumpkin("Pumpkin"),
  peaches("Peaches"),
  quinoa("Quinoa"),
  spinach("Spinach"),
  strawberries("Strawberries"),
  sweetPotatoes("Sweet Potatoes"),
  yukonPotatoes("Yukon Gold Potatoes");

  final String displayName;

  const Food(this.displayName);

  static Food? fromJson(String? json) {
    if (json == null || json.isEmpty) {
      return null;
    }

    return Food.values.firstWhere((element) => element.toJson() == json);
  }

  String toJson() => name.constantCase;
}
