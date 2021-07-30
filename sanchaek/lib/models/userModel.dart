import 'package:json_annotation/json_annotation.dart';
import 'package:sanchaek/models/goalModel.dart';

part 'userModel.g.dart';

@JsonSerializable()
class UserModel {
  final String name;
  final List<GoalModel> goal;

  UserModel({
    this.name,
    this.goal,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
