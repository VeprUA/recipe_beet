// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Section _$SectionFromJson(Map<String, dynamic> json) => Section(
      recipeId: json['recipe_id'] as String,
      type: $enumDecode(_$SectionTypeEnumMap, json['type']),
      order: json['order'] as int,
      id: json['id'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$SectionToJson(Section instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'recipe_id': instance.recipeId,
      'type': _$SectionTypeEnumMap[instance.type],
      'order': instance.order,
    };

const _$SectionTypeEnumMap = {
  SectionType.text: 'text',
  SectionType.image: 'image',
};
