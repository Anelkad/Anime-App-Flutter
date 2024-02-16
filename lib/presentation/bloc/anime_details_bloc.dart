import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_flutter/data/repository.dart';
import 'package:movie_app_flutter/presentation/bloc/anime_details_state.dart';

part 'anime_details_event.dart';

class AnimeDetailsBloc extends Bloc<AnimeDetailsEvent, AnimeDetailsState> {
  final AnimeRepository _repository;

  AnimeDetailsBloc(this._repository) : super(AnimeDetailsInitial()) {
    on<LoadAnimeDetails>((event, emit) async {
      var animeDetailsFuture = await AnimeRepository().getAnime(event.animeId);
      emit(AnimeDetailsLoaded(animeDetails: animeDetailsFuture.data));
    });
  }
}
