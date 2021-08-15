// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) {
  return BookModel(
    bookId: json['bookId'] as int,
    title: json['title'] as String,
    contents: json['contents'] as String,
    url: json['url'] as String,
    dateTime: json['dateTime'] as String,
    authors: json['authors'] as String,
    publisher: json['publisher'] as String,
    translators: json['translators'] as String,
    thumbnail: json['thumbnail'] as String,
    isbn: json['isbn'] as String,
    isRead: json['isRead'] as bool,
    isSaved: json['isSaved'] as bool,
  );
}

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
      'bookId': instance.bookId,
      'title': instance.title,
      'contents': instance.contents,
      'url': instance.url,
      'dateTime': instance.dateTime,
      'authors': instance.authors,
      'publisher': instance.publisher,
      'translators': instance.translators,
      'thumbnail': instance.thumbnail,
      'isbn': instance.isbn,
      'isRead': instance.isRead,
      'isSaved': instance.isSaved,
    };
