import 'package:flutter/material.dart';

import 'main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static final String routeName = '/filters';
  final Function saveFilters;
  final bool glutenFree;
  final bool vegetarian;
  final bool vegan;
  final bool lactoseFree;

  const FilterScreen(
    this.saveFilters, {
    @required this.glutenFree,
    @required this.vegetarian,
    @required this.vegan,
    @required this.lactoseFree,
  });

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.glutenFree;
    _vegetarian = widget.vegetarian;
    _vegan = widget.vegan;
    _lactoseFree = widget.lactoseFree;
    super.initState();
  }

  SwitchListTile _buildSwitchListTile(
    String title,
    String subtitle,
    bool value,
    Function onChange,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChange,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget.saveFilters({
                'gluten': _glutenFree,
                'vegetarian': _vegetarian,
                'vegan': _vegan,
                'lactose': _lactoseFree,
              });
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              _buildSwitchListTile(
                  'Gluten free', 'Only include gluten-free meals', _glutenFree,
                  (value) {
                setState(() {
                  _glutenFree = value;
                });
              }),
              _buildSwitchListTile(
                  'Vegetarian', 'Only include vegetarian meals', _vegetarian,
                  (value) {
                setState(() {
                  _vegetarian = value;
                });
              }),
              _buildSwitchListTile('Vegan', 'Only include vegan meals', _vegan,
                  (value) {
                setState(() {
                  _vegan = value;
                });
              }),
              _buildSwitchListTile('Lactose free',
                  'Only include lactose-free meals', _lactoseFree, (value) {
                setState(() {
                  _lactoseFree = value;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
