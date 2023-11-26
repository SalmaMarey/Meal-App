import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/meal.dart';
import '../screens/meals_screen.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key,
      required this.category,
      required this.onToggleFavorite,
      required this.availableMeals});
  final Category category;
  final void Function(Meal meal) onToggleFavorite;
  final List<Meal> availableMeals;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      //GestureDetector
      onTap: () {
        final filterdMeal = availableMeals
            .where(
              (meal) => meal.categories.contains(category.id),
            )
            .toList();
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: ((context) => const MealsScreen()),
        //   ),
        // );
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MealsScreen(
                    title: category.title,
                    meals: filterdMeal,
                    onToggleFavorite: onToggleFavorite,
                  )),
        );
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.54),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Image.network(
              category.imageUrl,
              height: 50,
              width: 50,
            ),
            Text(
              category.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ],
        ),
      ),
    );
  }
}
