import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/anime_details_bloc.dart';

import 'anime_details.dart';

class MovieDetailsPage extends StatefulWidget {
  final int animeId;

  MovieDetailsPage({required this.animeId});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  late AnimeDetailsBloc animeDetailsBloc;

  @override
  void initState() {
    animeDetailsBloc = AnimeDetailsBloc();
    animeDetailsBloc..add(LoadAnimeDetails(animeId: widget.animeId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocBuilder<AnimeDetailsBloc, AnimeDetailsState>(
        bloc: animeDetailsBloc,
        builder: (BuildContext context, state) {
          if (state is AnimeDetailsInitial) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AnimeDetailsLoaded) {
            return AnimeDetailsView(animeDetails: state.animeDetails);
          }
          return Center(
            child: Text('Error'),
          );
        },
      ),
    );
  }
}
