import 'package:flutter/material.dart';
import './category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({@required this.id, @required this.title, @required this.color});

  Function selectCategory(BuildContext context) {
    return () => Navigator.of(context)
            .pushNamed(CategoryMealsScreen.routeName, arguments: {
          'id': id,
          'title': title,
        });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderRadius = BorderRadius.circular(15);

    return InkWell(
      onTap: selectCategory(context),
      splashColor: theme.primaryColor,
      borderRadius: borderRadius,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: theme.textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
