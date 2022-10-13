import 'package:json_annotation/json_annotation.dart';
import 'actor_model.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel {
  @JsonKey(name: "Title")
  String? title;
  @JsonKey(name: "Year")
  String? year;
  @JsonKey(name: "Runtime")
  String? runtime;
  @JsonKey(name: "Poster")
  String? poster;
  @JsonKey(name: "Genres")
  String? genres;
  @JsonKey(name: "Description")
  String? description;
  @JsonKey(name: "Actors")
  List<Actors>? actors;

  MovieModel(
      {this.title,
      this.year,
      this.runtime,
      this.poster,
      this.genres,
      this.description,
      this.actors});

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
