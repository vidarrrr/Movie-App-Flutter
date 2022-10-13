import 'package:dio/dio.dart';
import 'package:movie_app_flutter/data/source/remote/movie_repository.dart';

class ProjectNetworkManager {
  static ProjectNetworkManager? _instance;
  static ProjectNetworkManager get instance {
    if (_instance != null) return _instance!;
    _instance = ProjectNetworkManager._init();
    return _instance!;
  }

  late final Dio _dio;
  late final RestClient restClient;

  ProjectNetworkManager._init() {
    _dio = Dio();
    restClient = RestClient(_dio);
  }
}
