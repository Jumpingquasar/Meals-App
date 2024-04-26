import 'package:flutter/material.dart';
import 'package:mealsapp/models/category.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.category, required this.meals});

  final Category category;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: meals.isNotEmpty
          ? ListView.builder(
              itemCount: meals.length,
              itemBuilder: (cts, index) => Mealitem(meal: meals[index]),
            )
          : Center(
              child: Text(
                'Uh, oh. No meals found.',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
    );
  }
}
