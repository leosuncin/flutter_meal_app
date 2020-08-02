import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildDrawerItem(IconData icon, String title, Function onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Roboto Condensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: theme.accentColor,
            child: Text(
              'Cooking up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: theme.primaryColor,
              ),
            ),
          ),
          SizedBox(height: 20),
          buildDrawerItem(
            Icons.restaurant,
            'Meals',
            () {
              Navigator.pushNamed(context, '/');
            },
          ),
          buildDrawerItem(
            Icons.settings,
            'Filters',
            () {},
          ),
        ],
      ),
    );
  }
}
