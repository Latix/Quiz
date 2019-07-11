import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';
class CategoryMeals extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMeals(this.availableMeals);
  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  String catTitle;
  List<Meal> displayedMeals;
  var _loadedInitState = false;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitState) {
      // TODO: implement didChangeDependencies
      final routeArg = ModalRoute.of(context).settings.arguments as Map<String, String>;
      final catId = routeArg['id'];
      catTitle = routeArg['title'];
      displayedMeals = widget.availableMeals.where((meals) {
        return meals.categories.contains(catId);
      }).toList();
      _loadedInitState = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id==mealId);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(catTitle),
      ),
      body: ListView.builder(itemBuilder: (ctx, index) {
        return MealItem(
          id: displayedMeals[index].id, 
          title: displayedMeals[index].title, 
          imageUrl: displayedMeals[index].imageUrl, 
          duration: displayedMeals[index].duration, 
          complexity: displayedMeals[index].complexity, 
          affordability: displayedMeals[index].affordability,
        );
      }, itemCount: displayedMeals.length,),
    );
  }
}