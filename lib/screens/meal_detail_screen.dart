import 'package:flutter/material.dart';
import '../dummy_data.dart';
class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  
  Widget sectionTitle(BuildContext ctx,String text) {
    return Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(text, 
            style: Theme.of(ctx).textTheme.title,
            ),
          );
  }

  Widget buildContainer(Widget child) {
    return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: 150,
            width: 300,
            child: child,
    );
  }
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final mealDetails = DUMMY_MEALS.firstWhere((meals) => mealId == meals.id);
    return Scaffold(
      appBar: AppBar(title: Text(mealDetails.title),
      ),
      body: SingleChildScrollView(
              child: Column(children: <Widget>[
            Container(
              height: 300, 
              width: double.infinity,
              child: Image.network(mealDetails.imageUrl, 
              fit: BoxFit.cover,),
            ),
            sectionTitle(context, 'Ingredients'),
            buildContainer(ListView.builder(itemBuilder: (ctx, index) {
                return Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(mealDetails.ingredients[index]),
                  ),
                );
              }, itemCount: mealDetails.ingredients.length,
              ),
            ),
            sectionTitle(context, 'Steps'),
            buildContainer(ListView.builder(itemBuilder: (ctx, index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(child: Text('# ${index+1}'),),
                      title: Text(mealDetails.steps[index]),
                      
                    ),
                    Divider(),
                  ],
                );
              }, itemCount: mealDetails.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
      ),
    );
  }
}
