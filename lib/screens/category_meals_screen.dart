import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMeals extends StatelessWidget {
  static const routeName = '';
  // final String id;
  // final String title;

  // CategoryMeals(this.id, this.title);
  @override
  Widget build(BuildContext context) {
    final routeArg = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final catId = routeArg['id'];
    final catTitle = routeArg['title'];
    final categoryMeals = DUMMY_MEALS.where((meals) {
      return meals.categories.contains(catId);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(catTitle),
      ),
      body: ListView.builder(itemBuilder: (ctx, index) {
        return MealItem(
          title: categoryMeals[index].title, 
          imageUrl: categoryMeals[index].imageUrl, 
          duration: categoryMeals[index].duration, 
          complexity: categoryMeals[index].complexity, 
          affordability: categoryMeals[index].affordability,
        );
      }, itemCount: categoryMeals.length,),
    );
  }
}