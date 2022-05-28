import 'package:flutter/material.dart';
import 'package:recipe_beet/recipe/models/recipe.model.dart';
import 'package:recipe_beet/recipe/providers/recipe.provider.dart';
import 'package:recipe_beet/recipe/recipe_detail.page.dart';
import 'package:uuid/uuid.dart';

const Uuid uuid = Uuid();

class RecipeListPage extends StatelessWidget {
  const RecipeListPage({Key? key}) : super(key: key);
  static RecipeProvider rp = RecipeProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.save),
            onPressed: () async {
              final Recipe recipe = Recipe(id: uuid.v4(), title: "test recipe");

              await rp.add(recipe);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RecipeDetailPage(id: recipe.id)),
              );
            }),
        body: Center(
          child: FutureBuilder<List<Recipe>>(
            future: rp.getRecipes(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: Text("Loading..."),
                );
              }

              if (snapshot.data!.isEmpty) {
                return const Center(
                  child:
                      Text("Feeling a bit hungry. Let's add our first recipe!"),
                );
              }

              return ListView(
                children: [
                  ...snapshot.data!.map((Recipe recipe) {
                    return ListTile(
                      title: Text(recipe.title),
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    RecipeDetailPage(id: recipe.id))))
                      },
                    );
                  })
                ],
              );
            },
          ),
        ));
  }
}
