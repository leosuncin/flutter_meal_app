import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  static final String routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
      ),
      body: Center(
        child: Text('Filters!'),
      ),
    );
  }
}
