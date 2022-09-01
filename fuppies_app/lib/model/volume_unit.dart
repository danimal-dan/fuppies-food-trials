enum VolumeUnit {
  teaspoon("Teaspoon", "tsp"),
  tablespoon("Tablespoon", "tbsp"),
  cup("Cup", "c"),
  ounce("Ounce", "oz"),
  milliliter("Milliliter", "ml");

  final String displayName;
  final String abbreviation;

  const VolumeUnit(this.displayName, this.abbreviation);
}
