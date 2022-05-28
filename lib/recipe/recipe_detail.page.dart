import 'package:flutter/material.dart';
import 'package:recipe_beet/recipe/models/recipe.model.dart';
import 'package:recipe_beet/recipe/providers/recipe.provider.dart';

class RecipeDetailPage extends StatelessWidget {
  final String id;
  static RecipeProvider rp = RecipeProvider();
  const RecipeDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FutureBuilder<Recipe>(
          future: rp.getRecipe(this.id), builder: recipeView),
    ));
  }

  Widget recipeView(BuildContext buildContext, AsyncSnapshot snapshot) {
    if (!snapshot.hasData) {
      return const Center(
        child: Text("Loading..."),
      );
    }
    final Recipe recipe = snapshot.data;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(recipe.title),
        OutlinedButton(
            onPressed: (() => Navigator.pop(buildContext)),
            child: const Text("Go Back"))
      ],
    );
  }
}
