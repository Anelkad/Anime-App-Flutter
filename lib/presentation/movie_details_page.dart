import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_flutter/presentation/bloc/anime_details_bloc.dart';
import 'package:movie_app_flutter/presentation/bloc/anime_details_state.dart';
import 'package:movie_app_flutter/service_locator.dart';

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
    animeDetailsBloc = AnimeDetailsBloc(sl.get());
    super.initState();
    animeDetailsBloc.add(LoadAnimeDetails(animeId: widget.animeId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: animeDetailsBloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: BlocConsumer<AnimeDetailsBloc, AnimeDetailsState>(
          listener: (context, state) {},
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
      ),
    );
  }
}
