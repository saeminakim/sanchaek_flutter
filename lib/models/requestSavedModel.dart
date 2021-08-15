import 'package:json_annotation/json_annotation.dart';

part 'requestSavedModel.g.dart';

@JsonSerializable()
class RequestSavedModel {
  final bool isSaved;

  RequestSavedModel({
    this.isSaved,
  });

  factory RequestSavedModel.fromJson(Map<String, dynamic> json) =>
      _$RequestSavedModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestSavedModelToJson(this);
}
