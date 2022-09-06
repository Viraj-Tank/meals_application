import 'package:flutter/material.dart';
import 'package:meals_application/screens/categories_screen.dart';
import 'package:meals_application/screens/category_meals_screen.dart';
import 'package:meals_application/screens/meal_detail_screen.dart';
import 'package:meals_application/screens/tab_screen_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals Application',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.pink,
        accentColor: Colors.amberAccent,
      ),
      // home: CategoriesScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        '/': (ctx) => TabsScreenState(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
    );
  }
}
