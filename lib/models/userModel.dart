import 'package:json_annotation/json_annotation.dart';
import 'package:sanchaek/models/goalModel.dart';

import 'bookModel.dart';
import 'journalModel.dart';

part 'userModel.g.dart';

@JsonSerializable()
class UserModel {
  final String name;
  final GoalModel goals;
  final List<JournalModel> journals;
  final List<BookModel> books;

  UserModel({
    this.name,
    this.goals,
    this.journals,
    this.books,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
