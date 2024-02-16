import 'package:equatable/equatable.dart';
import 'package:movie_app_flutter/data/api_client.dart';

abstract class AnimeDetailsState extends Equatable {
  const AnimeDetailsState();
  @override
  List<Object> get props => [];
}

class AnimeDetailsLoaded extends AnimeDetailsState {
  final AnimeDetails animeDetails;

  const AnimeDetailsLoaded({required this.animeDetails});

  @override
  List<Object> get props => [animeDetails];
}

class AnimeDetailsInitial extends AnimeDetailsState {}
