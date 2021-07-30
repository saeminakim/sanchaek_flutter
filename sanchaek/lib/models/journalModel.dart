import 'package:json_annotation/json_annotation.dart';

part 'journalModel.g.dart';

@JsonSerializable()
class JournalModel {
  final String content;

  JournalModel({
    this.content,
  });

  factory JournalModel.fromJson(Map<String, dynamic> json) =>
      _$JournalModelFromJson(json);

  Map<String, dynamic> toJson() => _$JournalModelToJson(this);
}
