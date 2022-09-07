import 'package:recase/recase.dart';

enum Food {
  blueberries("Blueberries"),
  yukonPotatoes("Yukon Potatoes"),
  pumpkin("Pumpkin"),
  peaches("Peaches");

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
