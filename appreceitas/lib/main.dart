import 'package:appreceitas/data/dummy_data.dart';
import 'package:appreceitas/models/meal.dart';
import 'package:appreceitas/models/settings.dart';
import 'package:appreceitas/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'screens/tabs_screen.dart';
// import 'screens/categories_screen.dart';
import 'screens/categories_meals_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availabMeals = dummyMeals;
  final List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _availabMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toogleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

   bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
        drawerTheme: const DrawerThemeData(
            backgroundColor: Colors.white, surfaceTintColor: Colors.white),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.red,
          secondary: Colors.white,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        AppRoutes.home: (ctx) => TabsScreen(_favoriteMeals),
        AppRoutes.categoriesMeals: (ctx) =>
            CategoriesMealsScreen(_availabMeals),
        AppRoutes.mealDetail: (ctx) =>
            MealDetailScreen(_toogleFavorite, _isFavorite),
        AppRoutes.settings: (ctx) => SettingsScreen(settings, _filterMeals),
      },
    );
  }
}
