// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    name: json['name'] as String,
    goals: json['goals'] == null
        ? null
        : GoalModel.fromJson(json['goals'] as Map<String, dynamic>),
    journals: (json['journals'] as List)
        ?.map((e) =>
            e == null ? null : JournalModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    books: (json['books'] as List)
        ?.map((e) =>
            e == null ? null : BookModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'name': instance.name,
      'goals': instance.goals,
      'journals': instance.journals,
      'books': instance.books,
    };
