import 'package:dio/dio.dart';
import 'package:movie_app_flutter/service_locator.dart';

import 'api_client.dart';

class AnimeRepository {
  final _movieApi = sl<ApiClient>();

  Future<AnimeDetailsResponse> getAnime(int animeId) async {
    try {
      return await _movieApi.getAnime(animeId);
    } on DioException catch (error) {
      throw error;
    }
  }

  Future<TopAnimeResponse> getTopAnime() async {
    try {
      return await _movieApi.getTopAnime('movie');
    } on DioException catch (error) {
      throw error;
    }
  }
}
