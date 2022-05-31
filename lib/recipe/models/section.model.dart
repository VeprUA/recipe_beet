import 'package:json_annotation/json_annotation.dart';

part 'section.model.g.dart';

enum SectionType { text, image }

@JsonSerializable()
class Section {
  static const String tableName = 'sections';
  final String? id;
  final String? title;
  final String? content;
  @JsonKey(name: 'recipe_id')
  final String recipeId;
  final SectionType type;
  final int order;

  const Section({
    required this.recipeId,
    required this.type,
    required this.order,
    this.id,
    this.title,
    this.content,
  });

  factory Section.fromJson(Map<String, dynamic> json) =>
      _$SectionFromJson(json);

  Map<String, dynamic> toJson() => _$SectionToJson(this);
}
