import 'package:recipe_beet/recipe/models/section.model.dart';
import 'package:sqflite/sqflite.dart';

class SectionProvider {
  static SectionProvider? _instance;
  Database? _db;

  SectionProvider._internal() {
    _instance = this;
  }

  factory SectionProvider() => _instance ?? SectionProvider._internal();

  set db(Database db) {
    _db = db;
  }

  Future<List<Section>> getSectionsFromRecipeId(String recipeId) async {
    final List<Map<String, dynamic>> jsonSections = await _db!.query(
        Section.tableName,
        where: 'recipe_id = ?',
        whereArgs: [recipeId]);

    List<Section> sections = jsonSections.isNotEmpty
        ? jsonSections
            .map((jsonSection) => Section.fromJson(jsonSection))
            .toList()
        : [];

    return sections;
  }

  Future<int> addSection(Section section) async {
    return await _db!.insert(Section.tableName, section.toJson());
  }

  Future<int> removeSection(String sectionId) async {
    return await _db!
        .delete(Section.tableName, where: 'id = ?', whereArgs: [sectionId]);
  }
}
