import 'package:json_annotation/json_annotation.dart';

part 'bookModel.g.dart';

@JsonSerializable()
class BookModel {
  final int bookId;
  final String title;
  final String contents;
  final String url;
  final DateTime dateTime;
  final String authors;
  final String publisher;
  final String translators;
  final String thumbnail;
  final String isbn;
  final bool isRead;
  final bool isSaved;

  BookModel({
    this.bookId,
    this.title,
    this.contents,
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

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookModelToJson(this);
}
