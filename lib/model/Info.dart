import 'package:json_annotation/json_annotation.dart';

part 'Info.g.dart';

@JsonSerializable()
class Info {
  int userId;
  int id;
  String title;
  String body;

  Info(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
  Map<String, dynamic> toJson() => _$InfoToJson(this);
}
