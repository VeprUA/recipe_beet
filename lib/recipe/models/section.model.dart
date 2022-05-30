import 'package:json_annotation/json_annotation.dart';

enum SectionType { text }

@JsonSerializable()
class Section {
  final String? id;
  final String? title;
  final String? content;
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

  factory Section.fromMap(Map<String, dynamic> json) => Section(
        id: json['id'],
        recipeId: json['recipeId'],
        type: json['type'],
        order: json['order'],
        content: json['content'],
        title: json['title'],
      );
}
