// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      title: json['Title'] as String?,
      year: json['Year'] as String?,
      runtime: json['Runtime'] as String?,
      poster: json['Poster'] as String?,
      genres: json['Genres'] as String?,
      description: json['Description'] as String?,
      actors: (json['Actors'] as List<dynamic>?)
          ?.map((e) => Actors.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'Title': instance.title,
      'Year': instance.year,
      'Runtime': instance.runtime,
      'Poster': instance.poster,
      'Genres': instance.genres,
      'Description': instance.description,
      'Actors': instance.actors,
    };
