import 'package:get_it/get_it.dart';
import 'package:movie_app_flutter/data/api_client.dart';
import 'package:movie_app_flutter/data/dio_client.dart';
import 'package:movie_app_flutter/data/repository.dart';

final sl = GetIt.I;

Future initLocator() async {
  final dio = buildDioClient("https://api.jikan.moe/v4/");
  sl.registerLazySingleton<ApiClient>(() => ApiClient(dio));
  sl.registerFactory(() => AnimeRepository());
}
