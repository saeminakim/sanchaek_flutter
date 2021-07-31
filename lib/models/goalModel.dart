import 'package:json_annotation/json_annotation.dart';

part 'goalModel.g.dart';

@JsonSerializable()
class GoalModel {
  final int numberOfBooks;

  GoalModel({
    this.numberOfBooks,
  });

  factory GoalModel.fromJson(Map<String, dynamic> json) =>
      _$GoalModelFromJson(json);

  Map<String, dynamic> toJson() => _$GoalModelToJson(this);
}
