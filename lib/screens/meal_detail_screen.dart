import 'package:flutter/material.dart';
import 'package:meals_application/models/dummy_data.dart';

import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-details';

  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String mealId = ModalRoute.of(context)?.settings.arguments as String;
    Meal meal = DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Ingredients",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              height: 200,
              width: 250,
              padding: EdgeInsets.all(8),
              alignment: Alignment.center,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: meal.ingredients.length,
                itemBuilder: (context, index) {
                  return Container(
                      decoration: BoxDecoration(
                        color: Colors.lightGreen.withOpacity(0.6),
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(
                          Radius.circular(2),
                        ),
                      ),
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        meal.ingredients[index],
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ));
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Steps",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 80),
              child: ListView.separated(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: meal.steps.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text("#$index"),
                        ),
                        title: Text("${meal.steps[index]}"),
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
