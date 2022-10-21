import 'package:json_annotation/json_annotation.dart';

part 'base_page_mo.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BasePageMo<T> {
  final int? curPage;
  final List<T>? datas;
  final int? offset;
  final bool? over;
  final int? pageCount;
  final int? size;
  final int? total;

  BasePageMo({
    this.curPage,
    this.datas,
    this.offset,
    this.over,
    this.pageCount,
    this.size,
    this.total,
  });

  factory BasePageMo.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) =>
      _$BasePageMoFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BasePageMoToJson<T>(this, toJsonT);
}
