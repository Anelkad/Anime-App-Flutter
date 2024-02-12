import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://api.jikan.moe/v4/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;
  @GET('anime/{id}')
  Future<AnimeDetails> getAnime(@Path("id") int id);
}

class AnimeDetails {
  late final int id;
  late final String title;

  AnimeDetails({required this.id, required this.title});

  factory AnimeDetails.fromJson(Map<String, dynamic> json) => AnimeDetails(
        id: json['data']['mal_id'],
        title: json['data']['title'],
      );
}
