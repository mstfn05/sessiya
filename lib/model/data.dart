import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  int userId;
  int id;
  String title;
  String body;

  Data(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
