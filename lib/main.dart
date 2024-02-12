import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'api_client.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // getMovie();
    return MaterialApp(
      home: MovieDetailsPage(),
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
  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  Future<void> getMovie() async {
    final movieApi = ApiClient(Dio());

    try {
      final movie = await movieApi.getAnime(50594);
      print(movie.title);
    } on DioException catch (error) {
      print(error.message);
    }
  }

  @override
  void initState() {
    super.initState();
    getMovie();
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
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                'https://cdn.myanimelist.net/images/anime/1598/128450l.jpg',
                width: double.infinity,
                height: 200.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            'Suzume no Tojimari',
            style: TextStyle(
              fontSize: 24,
              color: Color(0xFFE5E5E5),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
