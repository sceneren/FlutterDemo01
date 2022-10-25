import 'package:json_annotation/json_annotation.dart';

part 'project_category_mo.g.dart';

@JsonSerializable()
class ProjectCategoryMo {
  final String? author;
  final int? courseId;
  final String? cover;
  final String? desc;
  final int? id;
  final String? lisense;
  final String? lisenseLink;
  final String? name;
  final int? order;
  final int? parentChapterId;
  final int? type;
  final bool? userControlSetTop;
  final int? visible;

  ProjectCategoryMo({
    this.author,
    this.courseId,
    this.cover,
    this.desc,
    this.id,
    this.lisense,
    this.lisenseLink,
    this.name,
    this.order,
    this.parentChapterId,
    this.type,
    this.userControlSetTop,
    this.visible,
  });

  factory ProjectCategoryMo.fromJson(Map<String, dynamic> json) =>
      _$ProjectCategoryMoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectCategoryMoToJson(this);
}

class ProjectCategoryMoList {
  List<ProjectCategoryMo>? list;

  ProjectCategoryMoList({this.list});

  factory ProjectCategoryMoList.fromJson(List<dynamic> json) {
    return ProjectCategoryMoList(
        list: json
            .map((e) => ProjectCategoryMo.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}
