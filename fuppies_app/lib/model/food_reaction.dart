import 'package:flutter/material.dart';

enum FoodReaction {
  loved("Loved", Icons.sentiment_satisfied_outlined),
  liked("Liked", Icons.sentiment_neutral_outlined),
  disliked("Disliked", Icons.sentiment_dissatisfied_outlined);

  final String displayName;
  final IconData icon;

  const FoodReaction(this.displayName, this.icon);
}
