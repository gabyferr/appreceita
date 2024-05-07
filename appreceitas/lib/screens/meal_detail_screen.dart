import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  final Function(Meal) onToggleFavorite;
  final bool Function(Meal) isFavorite;

  const MealDetailScreen( 
    this.onToggleFavorite, 
    this.isFavorite, 
  {super.key, 
  });


  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget _createSectionContainer(Widget child) {
    return DecoratedBox(
      decoration: const BoxDecoration(color: Colors.white),
      child: Container(
        width: 330,
        height: 200,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          meal.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              _createSectionTitle(context, 'Ingredientes'),
              _createSectionContainer(
                ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(
                          meal.ingredients[index],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
              _createSectionTitle(context, 'Passos'),
              _createSectionContainer(ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text(meal.steps[index]),
                      ),
                      const Divider(),
                    ],
                  );
                },
              )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
       child: const Icon(Icons.star),
        onPressed: () {
          onToggleFavorite(meal);
        },
      ),
    );
  }
}
