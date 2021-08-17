import 'package:json_annotation/json_annotation.dart';

part 'wishListModel.g.dart';

@JsonSerializable()
class WishListModel {
  final int wishBookId;
  final String title;
  final String content;
  final String url;
  final String dateTime;
  final String authors;
  final String publisher;
  final String translators;
  final String thumbnail;
  final String isbn;
  bool isRead;
  bool isSaved;

  WishListModel({
    this.wishBookId,
    this.title,
    this.content,
    this.url,
    this.dateTime,
    this.authors,
    this.publisher,
    this.translators,
    this.thumbnail,
    this.isbn,
    this.isRead,
    this.isSaved,
  });

  factory WishListModel.fromJson(Map<String, dynamic> json) =>
      _$WishListModelFromJson(json);

  Map<String, dynamic> toJson() => _$WishListModelToJson(this);
}
