import 'package:flutter/material.dart';

import 'meal_item.dart';
import 'models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final Set<Meal> favoriteMeals;

  const FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty)
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    else
      return ListView.builder(
        itemBuilder: (ctx, index) {
          final meal = favoriteMeals.elementAt(index);

          return MealItem(
            id: meal.id,
            title: meal.title,
            imageUrl: meal.imageUrl,
            duration: meal.duration,
            complexity: meal.complexity,
            affordability: meal.affordability,
          );
        },
        itemCount: favoriteMeals.length,
      );
  }
}
