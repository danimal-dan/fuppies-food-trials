import 'package:recase/recase.dart';

enum VolumeUnit {
  teaspoon("Teaspoon", "tsp"),
  tablespoon("Tablespoon", "tbsp"),
  cup("Cup", "c"),
  ounce("Ounce", "oz"),
  milliliter("Milliliter", "ml");

  final String displayName;
  final String abbreviation;

  const VolumeUnit(this.displayName, this.abbreviation);

  static VolumeUnit? fromJson(String? json) {
    if (json == null || json.isEmpty) {
      return null;
    }

    return VolumeUnit.values.firstWhere((element) => element.toJson() == json);
  }

  String toJson() => name.constantCase;
}
