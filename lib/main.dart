import 'dart:ui';

import 'package:flutter/material.dart';

import 'dummy_data.dart';
import 'models/meal.dart';
import 'filter_screen.dart';
import './meal_detail_screen.dart';
import './category_meals_screen.dart';
import './tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegetarian': false,
    'vegan': false,
    'lactose': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  Set<Meal> _favoriteMeals = Set();

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (filterData['gluten']) return meal.isGlutenFree;
        if (filterData['vegetarian']) return meal.isVegetarian;
        if (filterData['vegan']) return meal.isVegan;
        if (filterData['lactose']) return meal.isLactoseFree;
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    var meal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    setState(() {
      print(meal.id);
      print(_favoriteMeals.contains(meal));

      if (_favoriteMeals.contains(meal)) {
        _favoriteMeals.remove(meal);
      } else {
        _favoriteMeals.add(meal);
      }

      print(_favoriteMeals.length);
    });
  }

  bool _isFavoriteMeal(String mealId) =>
      _favoriteMeals.any((meal) => meal.id == mealId);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: TextStyle(
                fontSize: 24,
                fontFamily: 'Roboto Condensed',
                fontWeight: FontWeight.bold,
              ),
            ),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TabsScreen(_favoriteMeals),
      routes: {
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_toggleFavorite, _isFavoriteMeal),
        FilterScreen.routeName: (context) => FilterScreen(
              _setFilters,
              glutenFree: _filters['gluten'],
              vegetarian: _filters['vegetarian'],
              vegan: _filters['vegan'],
              lactoseFree: _filters['lactose'],
            ),
      },
    );
  }
}
