import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_flutter/repository.dart';

import 'api_client.dart';

part 'anime_details_event.dart';
part 'anime_details_state.dart';

class AnimeDetailsBloc extends Bloc<AnimeDetailsEvent, AnimeDetailsState> {
  AnimeDetailsBloc() : super(AnimeDetailsInitial()) {
    on<LoadAnimeDetails>((event, emit) async {
      var animeDetailsFuture = await AnimeRepository().getAnime(event.animeId);
      emit(AnimeDetailsLoaded(animeDetails: animeDetailsFuture.data));
    });
  }
}
