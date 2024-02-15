import 'package:flutter/material.dart';
import 'package:movie_app_flutter/api_client.dart';
import 'package:movie_app_flutter/repository.dart';
import 'package:movie_app_flutter/service_locator.dart';

import 'movie_details_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<TopAnimeResponse> topAnimeResponse;

  @override
  void initState() {
    initLocator();
    topAnimeResponse = AnimeRepository().getTopAnime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF1D2135),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF1D2135),
        ),
      ),
      home: FutureBuilder<TopAnimeResponse>(
        future: topAnimeResponse,
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
            return TopAnime(
              items: snapshot.data!.data,
            );
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

class TopAnime extends StatelessWidget {
  final List<AnimeDetails> items;

  TopAnime({required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    items[index].url,
                    width: double.infinity,
                    height: 235,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 9),
                Text(
                  items[index].title,
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFFE5E5E5),
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none),
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MovieDetailsPage(animeId: items[index].id),
                  ));
            });
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          // Number of columns
          crossAxisSpacing: 23,
          // Spacing between columns
          mainAxisSpacing: 20,
          // Spacing between rows
          childAspectRatio: 0.7,
          mainAxisExtent: 280),
    );
  }
}
