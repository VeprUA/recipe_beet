import 'package:json_annotation/json_annotation.dart';

part 'recipe.model.g.dart';

@JsonSerializable()
class Recipe {
  static const String tableName = 'recipes';
  final String id;
  final String title;
  @JsonKey(name: 'banner_url')
  final String? bannerUrl;

  const Recipe({required this.id, required this.title, this.bannerUrl});

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);

  @override
  String toString() {
    return 'Recipe{id: $id, title: $title, bannerUrl: $bannerUrl}';
  }
}
