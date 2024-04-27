import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/data/meal_data.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/providers/filters_provider.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});

final filteredFavoriteMealsProvider = Provider((ref) {
  final filteredMeals = ref.watch(filteredMealsProvider);
  final favoriteMeals = ref.watch(favoriteMealsProvider);
  return filteredMeals.where((meal) {
    if (favoriteMeals.contains(meal)) return true;
    return false;
  }).toList();
});
