import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'anime_details.dart';
import 'api_client.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // getMovie();
    return MaterialApp(
      home: MovieDetailsPage(animeId: 50594),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF1D2135),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF1D2135),
        ),
      ),
    );
  }
}

class MovieDetailsPage extends StatefulWidget {
  final int animeId;

  MovieDetailsPage({required this.animeId});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  late Future<AnimeDetailsResponse> animeDetailsFuture;

  Future<AnimeDetailsResponse> getAnime() async {
    final movieApi = ApiClient(Dio());

    try {
      return await movieApi.getAnime(widget.animeId);
    } on DioException catch (error) {
      throw error;
    }
  }

  void getTopAnime() async {
    final movieApi = ApiClient(Dio());

    try {
      var result = await movieApi.getTopAnime();
      print(result.data[0].title);
    } on DioException catch (error) {
      throw error;
    }
  }

  @override
  void initState() {
    super.initState();
    getTopAnime();
    animeDetailsFuture = getAnime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<AnimeDetailsResponse>(
        future: animeDetailsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while fetching data
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // Show an error message if there's an error
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            // Show the anime details once the data is available
            AnimeDetails animeDetails = snapshot.data!.data;
            return AnimeDetailsView(animeDetails: animeDetails);
          } else {
            // Handle other states here if needed
            return Center(
              child: Text('Unexpected state.'),
            );
          }
        },
      ),
    );
  }
}
