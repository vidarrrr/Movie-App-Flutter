// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_repository.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RestClient implements RestClient {
  _RestClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://my-json-server.typicode.com/vidarrrr/fake-movies-api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<MovieModel>> getMovies() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<List<MovieModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/movies',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => MovieModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<MovieModel>> getBoxOfficeMovies() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<List<MovieModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/box_office',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => MovieModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<List<MovieModel>> getComingSoonMovies() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<List<dynamic>>(_setStreamType<List<MovieModel>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/coming_soon',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => MovieModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
