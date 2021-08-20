// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WishListModel _$WishListModelFromJson(Map<String, dynamic> json) {
  return WishListModel(
    wishBookId: json['wishBookId'] as int,
    title: json['title'] as String,
    content: json['content'] as String,
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

Map<String, dynamic> _$WishListModelToJson(WishListModel instance) =>
    <String, dynamic>{
      'wishBookId': instance.wishBookId,
      'title': instance.title,
      'content': instance.content,
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
