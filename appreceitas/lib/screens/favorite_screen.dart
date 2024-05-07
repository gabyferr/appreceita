import 'package:appreceitas/components/meal_item.dart';
import 'package:appreceitas/models/meal.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoriteScreen(this.favoriteMeals, {super.key});

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const DecoratedBox(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: Text('Nenhuma refeição foi marcada como favoritas'),
        ),
      );
    } else {
      return DecoratedBox(
        decoration: const BoxDecoration(color: Colors.white),
        child: ListView.builder(
          itemCount: favoriteMeals.length,
          itemBuilder: (ctx, index) {
            return MealItem(favoriteMeals[index]);
          },
        ),
      );
    }
  }
}
