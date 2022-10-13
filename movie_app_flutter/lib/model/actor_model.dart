import 'package:json_annotation/json_annotation.dart';

part 'actor_model.g.dart';

@JsonSerializable()
class Actors {
  @JsonKey(name: "UserPhotoURL")
  String? userPhotoURL;
  @JsonKey(name: "UserName")
  String? userName;
  @JsonKey(name: "UserRole")
  String? userRole;

  Actors({this.userPhotoURL, this.userName, this.userRole});

  factory Actors.fromJson(Map<String, dynamic> json) => _$ActorsFromJson(json);

  Map<String, dynamic> toJson() => _$ActorsToJson(this);
}
