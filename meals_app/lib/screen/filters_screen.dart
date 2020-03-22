import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.saveFilters, this.currentFilters);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

  Widget buildSwitchListTile(
      String text, String subtitle, bool newValue, Function value) {
    return SwitchListTile(
      title: Text(text),
      subtitle: Text(subtitle),
      value: newValue,
      onChanged: value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                  'lactose': _lactoseFree,
                };
                widget.saveFilters(selectedFilters);
              },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text('Adjust your meal selection',
                  style: Theme.of(context).textTheme.title),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  buildSwitchListTile(
                      'Gluten Free',
                      'Only includes Gluten free items',
                      _glutenFree, (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }),
                  buildSwitchListTile('Vegetarian',
                      'Only includes meat free items', _vegetarian, (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),
                  buildSwitchListTile(
                      'Vegan', 'Only includes vegan items', _vegan, (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
                  buildSwitchListTile(
                      'Lactose Free',
                      'Only includes Lactose free items',
                      _lactoseFree, (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
                ],
              ),
            ),
          ],
        ));
  }
}
