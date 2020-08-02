import 'package:flutter/material.dart';

import 'main_drawer.dart';

class FilterScreen extends StatelessWidget {
  static final String routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Filters!'),
      ),
    );
  }
}
