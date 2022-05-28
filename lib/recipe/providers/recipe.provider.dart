import 'package:recipe_beet/recipe/models/recipe.model.dart';
import 'package:sqflite/sqflite.dart';

class RecipeProvider {
  static RecipeProvider? _instance;
  Database? _db;

  RecipeProvider._internal() {
    _instance = this;
  }

  factory RecipeProvider() => _instance ?? RecipeProvider._internal();
  set db(Database db) {
    _db = db;
  }

  Future<List<Recipe>> getRecipes() async {
    final recipes = await _db!.query(Recipe.tableName, orderBy: 'title');

    List<Recipe> recipeList = recipes.isNotEmpty
        ? recipes.map((r) => Recipe.fromMap(r)).toList()
        : [];
    return recipeList;
  }

  Future<int> add(Recipe recipe) async {
    return await _db!.insert(Recipe.tableName, recipe.toMap());
  }

  Future<Recipe> getRecipe(String id) async {
    final List<Map<String, dynamic>> recipeMapList =
        await _db!.query(Recipe.tableName, where: 'id = ?', whereArgs: [id]);
    if (recipeMapList.isEmpty) {
      throw Exception("Can't locate recipe");
    }
    return Recipe.fromMap(recipeMapList[0]);
  }
}
