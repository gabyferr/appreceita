import 'package:appreceitas/models/meal.dart';
import 'package:flutter/material.dart';
import '../components/meal_item.dart';
import '../models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final List<Meal>meals;
  const CategoriesMealsScreen(this.meals,{super.key, });

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(color: Colors.white),
        child: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (ctx, index) {
            return MealItem(categoryMeals[index]);
          },
        ),
      ),
    );
  }
}
