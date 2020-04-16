import 'package:flutter/material.dart';
import 'package:mark_it/providers/product.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';


class CategoryItemsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  @override
  _CategoryItemsScreenState createState() => _CategoryItemsScreenState();
}

class _CategoryItemsScreenState extends State<CategoryItemsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  bool _loadedinitData = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _removeMeal(mealId) {
    setState(() {
      displayedMeals.removeWhere((item) => mealId == item.id);
    });
  }

  @override
  void didChangeDependencies() {
    if (!_loadedinitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final String categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedinitData = true;
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final availableProducts = Provider.of<Products>(context).items;
    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryTitle'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
