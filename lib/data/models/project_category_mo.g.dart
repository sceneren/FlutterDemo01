// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_category_mo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectCategoryMo _$ProjectCategoryMoFromJson(Map<String, dynamic> json) =>
    ProjectCategoryMo(
      author: json['author'] as String?,
      courseId: json['courseId'] as int?,
      cover: json['cover'] as String?,
      desc: json['desc'] as String?,
      id: json['id'] as int?,
      lisense: json['lisense'] as String?,
      lisenseLink: json['lisenseLink'] as String?,
      name: json['name'] as String?,
      order: json['order'] as int?,
      parentChapterId: json['parentChapterId'] as int?,
      type: json['type'] as int?,
      userControlSetTop: json['userControlSetTop'] as bool?,
      visible: json['visible'] as int?,
    );

Map<String, dynamic> _$ProjectCategoryMoToJson(ProjectCategoryMo instance) =>
    <String, dynamic>{
      'author': instance.author,
      'courseId': instance.courseId,
      'cover': instance.cover,
      'desc': instance.desc,
      'id': instance.id,
      'lisense': instance.lisense,
      'lisenseLink': instance.lisenseLink,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'type': instance.type,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible,
    };
