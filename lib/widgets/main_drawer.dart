import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onChangeScreen});

  final void Function(String screenName) onChangeScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Theme.of(context).colorScheme.primaryContainer, Theme.of(context).colorScheme.primaryContainer.withOpacity(0.6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
            child: Row(
              children: [
                const Icon(Icons.fastfood),
                const SizedBox(width: 10),
                Text(
                  'Cooking Up!',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.restaurant, size: 26),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            onTap: () {
              onChangeScreen('Meals');
            },
          ),
          ListTile(
            leading: const Icon(Icons.filter_alt_off, size: 26),
            title: Text(
              'Filter Meal',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            onTap: () {
              onChangeScreen('Filters');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings, size: 26),
            title: Text(
              'Settings',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            onTap: () {
              onChangeScreen('Settings');
            },
          ),
        ],
      ),
    );
  }
}
