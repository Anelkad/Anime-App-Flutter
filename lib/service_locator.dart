import 'package:get_it/get_it.dart';
import 'package:movie_app_flutter/api_client.dart';
import 'package:movie_app_flutter/dio_client.dart';

final sl = GetIt.I;

Future initLocator() async {
  final dio = buildDioClient("https://api.jikan.moe/v4/");
  sl.registerLazySingleton<ApiClient>(() => ApiClient(dio));
}
