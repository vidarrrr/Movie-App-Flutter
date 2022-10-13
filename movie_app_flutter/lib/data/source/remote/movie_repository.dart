import 'package:dio/dio.dart';
import 'package:movie_app_flutter/model/movie_model.dart';
import 'package:retrofit/retrofit.dart';

part 'movie_repository.g.dart';

@RestApi(
    baseUrl: "https://my-json-server.typicode.com/vidarrrr/fake-movies-api/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/movies")
  Future<List<MovieModel>> getMovies();

  @GET("/box_office")
  Future<List<MovieModel>> getBoxOfficeMovies();

  @GET("/coming_soon")
  Future<List<MovieModel>> getComingSoonMovies();
}
