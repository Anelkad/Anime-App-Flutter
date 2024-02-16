import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('anime/{id}')
  Future<AnimeDetailsResponse> getAnime(@Path("id") int id);

  @GET('top/anime')
  Future<TopAnimeResponse> getTopAnime(@Query("type") String type);
}

class TopAnimeResponse {
  final List<AnimeDetails> data;

  TopAnimeResponse({required this.data});

  factory TopAnimeResponse.fromJson(Map<String, dynamic> json) {
    print('Raw JSON: $json');

    return TopAnimeResponse(
      data: (json['data'] as List<dynamic>)
          .map((animeJson) => AnimeDetails.fromJson(animeJson))
          .toList(),
    );
  }
}

class AnimeDetailsResponse {
  final AnimeDetails data;

  AnimeDetailsResponse({required this.data});

  factory AnimeDetailsResponse.fromJson(Map<String, dynamic> json) {
    return AnimeDetailsResponse(
      data: AnimeDetails.fromJson(json['data']),
    );
  }
}

class AnimeDetails {
  late final int id;
  late final String title;
  late final String url;
  late final String rating;
  late final String synopsis;

  AnimeDetails(
      {required this.id,
      required this.title,
      required this.url,
      required this.rating,
      required this.synopsis});

  factory AnimeDetails.fromJson(Map<String, dynamic> json) => AnimeDetails(
      id: json['mal_id'],
      title: json['title'],
      url: json['images']['jpg']['large_image_url'],
      rating: json['rating'],
      synopsis: json['synopsis']);
}
