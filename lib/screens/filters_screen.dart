import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan      = false;
  bool _lactoseFree= false;
  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }
  Widget _buildSwitchListTile (
    String title, 
    String description, 
    bool currentValue, 
    Function updateValue) {
    return SwitchListTile(
                title: Text(title), 
                value: currentValue, 
                subtitle: Text(description), 
                onChanged: updateValue,
              );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        actions: <Widget>[
            IconButton(icon: Icon(Icons.save), onPressed: () {
              final selectedFilters = {
              'gluten': _glutenFree,
              'lactose': _lactoseFree,
              'vegan': _vegan,
              'vegetarian': _vegetarian,
            };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Text('Adjust Your meal selection',
            style: Theme.of(context).textTheme.title,
          ),
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              _buildSwitchListTile('Gluten-free', 'Only gluten-free', _glutenFree, (val) {
                  setState(() {
                    _glutenFree = val;
                  });
                },
              ),
              _buildSwitchListTile('Vegetarian-free', 'Only vegetarian-free', _vegetarian, (val) {
                  setState(() {
                    _vegetarian = val;
                  });
                },
              ),
              _buildSwitchListTile('Vegan-free', 'Only vegan-free', _vegan, (val) {
                  setState(() {
                    _vegan = val;
                  });
                },
              ),
              _buildSwitchListTile('Lactose-free', 'Onlylactose-free', _lactoseFree, (val) {
                  setState(() {
                    _lactoseFree = val;
                  });
                },
              ),
            ],
          ),
        ),
      ],),
    );
  }
}