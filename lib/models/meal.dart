import 'package:flutter/foundation.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

extension ParseComplexityToString on Complexity {
  String getLabel() {
    return this.toString().split('.').last;
  }
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

extension ParseAffordabilityToString on Affordability {
  String getLabel() {
    return this.toString().split('.').last;
  }
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.steps,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
  });

  @override
  bool operator ==(other) {
    return other is Meal && id == other.id;
  }

  @override
  int get hashCode => id.hashCode;
}
