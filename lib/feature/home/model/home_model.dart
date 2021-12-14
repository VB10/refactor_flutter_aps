import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ResourceModel {
  int? page;

  int? perPage;
  int? total;
  @JsonKey(ignore: true)
  int? totalPages;
  List<Data>? data;
  Support? support;

  bool isPageHigher() {
    return (page ?? 0) > 1;
  }

  ResourceModel({this.page, this.perPage, this.total, this.totalPages, this.data, this.support});

  factory ResourceModel.fromJson(Map<String, dynamic> json) {
    return _$ResourceModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResourceModelToJson(this);
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Data {
  final int? id;
  final String? name;
  final int? year;
  final String? color;
  final String? pantoneValue;

  Data({this.id, this.name, this.year, this.color, this.pantoneValue});

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Support {
  String? url;
  String? text;

  Support({this.url, this.text});

  factory Support.fromJson(Map<String, dynamic> json) {
    return _$SupportFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SupportToJson(this);
  }
}
