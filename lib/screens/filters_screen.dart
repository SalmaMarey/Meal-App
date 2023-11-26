import 'package:flutter/material.dart';
// import 'package:meal_app/screens/tabs_screen.dart';

// import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currenFilters});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
  final Map<Filter, bool> currenFilters;
}

enum Filter {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFreeFilter = false;
  bool _lactoseFreeFilter = false;
  bool _veganFilter = false;
  bool _vegetarianFilter = false;
  @override
  void initState() {
    super.initState();
    _glutenFreeFilter = widget.currenFilters[Filter.glutenFree]!;
    _lactoseFreeFilter = widget.currenFilters[Filter.lactoseFree]!;
    _veganFilter = widget.currenFilters[Filter.vegan]!;
    _vegetarianFilter = widget.currenFilters[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     {
      //       Navigator.of(context).pop();
      //       if (identifier == 'meals') {
      //         Navigator.pushReplacement(context,
      //             MaterialPageRoute(builder: (ctx) => const TabsScreen()));
      //       }
      //     }
      //   },
      // ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilter,
            Filter.lactoseFree: _lactoseFreeFilter,
            Filter.vegan: _veganFilter,
            Filter.vegetarian: _vegetarianFilter,
          });
          return false;
        },
        child: Column(
          children: [
            customSwitch(
              context,
              'Gluten-free',
              'Only include gluten-free meals',
              _glutenFreeFilter,
              (bool value) {
                setState(() {
                  _glutenFreeFilter = value;
                });
              },
            ),
            customSwitch(
              context,
              'Lactose-free',
              'Only include Lactose-free meals',
              _lactoseFreeFilter,
              (bool value) {
                setState(() {
                  _lactoseFreeFilter = value;
                });
              },
            ),
            customSwitch(
              context,
              'Vegan',
              'Only include vegan meals',
              _veganFilter,
              (bool value) {
                setState(() {
                  _veganFilter = value;
                });
              },
            ),
            customSwitch(
              context,
              'Vegetarian',
              'Only include vegetarian meals',
              _vegetarianFilter,
              (bool value) {
                setState(() {
                  _vegetarianFilter = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  SwitchListTile customSwitch(BuildContext context, String title,
      String subtitle, bool filter, Function(bool newValue) onChanged) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      onChanged: onChanged,
      value: filter,
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
