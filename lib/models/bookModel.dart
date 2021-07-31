import 'package:json_annotation/json_annotation.dart';

part 'bookModel.g.dart';

@JsonSerializable()
class BookModel {
  final String title;

  BookModel({
    this.title,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookModelToJson(this);
}
