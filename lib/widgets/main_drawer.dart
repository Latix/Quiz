import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';
class MainDrawer extends StatelessWidget {
  void getRoute(BuildContext ctx, String routeName) {
    Navigator.of(ctx).pushReplacementNamed(routeName);
  }
  Widget _buildList(String text, IconData icon, Function tapHandler) {
    return ListTile(
            leading: Icon(
              icon, size: 26,
            ),
            title: Text(text, 
            style: TextStyle(
              fontFamily: 'Workwise',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              ),
            ),
            onTap: tapHandler,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text('Cooking Up!', style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(height: 20,),
          _buildList('Meals', Icons.restaurant, () {
            getRoute(context, '/');
          }),
          _buildList('filters', Icons.settings, () {
            getRoute(context, FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}