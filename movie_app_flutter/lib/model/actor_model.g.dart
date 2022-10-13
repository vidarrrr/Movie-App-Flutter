// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Actors _$ActorsFromJson(Map<String, dynamic> json) => Actors(
      userPhotoURL: json['UserPhotoURL'] as String?,
      userName: json['UserName'] as String?,
      userRole: json['UserRole'] as String?,
    );

Map<String, dynamic> _$ActorsToJson(Actors instance) => <String, dynamic>{
      'UserPhotoURL': instance.userPhotoURL,
      'UserName': instance.userName,
      'UserRole': instance.userRole,
    };
