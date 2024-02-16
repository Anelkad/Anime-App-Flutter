part of 'anime_details_bloc.dart';

abstract class AnimeDetailsEvent extends Equatable {
  const AnimeDetailsEvent();
  @override
  List<Object> get props => [];
}

class LoadAnimeDetails extends AnimeDetailsEvent {
  int animeId;
  LoadAnimeDetails({required this.animeId});
}
