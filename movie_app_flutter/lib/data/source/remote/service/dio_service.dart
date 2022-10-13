import 'package:dio/dio.dart';
import 'package:movie_app_flutter/data/source/remote/service/project_network_manager.dart';
import 'package:movie_app_flutter/model/movie_model.dart';

abstract class IMovieService {
  Future<List<MovieModel>?> getMovies(Function(String?) onError);
  Future<List<MovieModel>?> getBoxOfficeMovies(Function(String?) onError);
  Future<List<MovieModel>?> getComingSoonMovies(Function(String?) onError);
}

//https://github.com/VB10/base_response_flutter/blob/7c7c4d7360d9c55ee91f357c8710b67d129dcdf8/lib/core/network/project_network_manager.dart
class DioService implements IMovieService {
  @override
  Future<List<MovieModel>?> getMovies(Function(String? error) onError) async {
    final client = ProjectNetworkManager.instance.restClient;
    try {
      final response = await client.getMovies();
      return response;
    } on DioError catch (error) {
      onError(error.message);
    }
    return null;
  }

  @override
  Future<List<MovieModel>?> getBoxOfficeMovies(
      Function(String? p1) onError) async {
    final client = ProjectNetworkManager.instance.restClient;
    try {
      final response = await client.getBoxOfficeMovies();
      return response;
    } on DioError catch (error) {
      onError(error.message);
    }
    return null;
  }

  @override
  Future<List<MovieModel>?> getComingSoonMovies(
      Function(String? p1) onError) async {
    final client = ProjectNetworkManager.instance.restClient;
    try {
      final response = await client.getComingSoonMovies();
      return response;
    } on DioError catch (error) {
      onError(error.message);
    }
    return null;
  }
}
