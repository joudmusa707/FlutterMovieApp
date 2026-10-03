import 'package:flutter/material.dart';
import 'package:movie_app/components/movie_card.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/providers/movie_provider.dart';
import 'package:movie_app/routes/movies_details.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MovieProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  initState() {
    Provider.of<MovieProvider>(context, listen: false).loadMovies(context);
    super.initState();
    // Load movies when the widget is first created
  }

  @override
  Widget build(BuildContext context) {
    final movieData = Provider.of<MovieProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Movies App")),
      body: Center(
        child: ListView.builder(
          itemCount: movieData.movieList.length,
          itemBuilder: (context, index) {
            final movie = movieData.movieList[index];
            return MovieCard(movie: movie);
            // return ListTile(
            //   title: Text(movie.title),
            //   subtitle: Text("${movie.year} - ${movie.director}"),
            //   trailing: Icon(Icons.movie),
            //   leading: CircleAvatar(child: Text(movie.title[0])),
            // );
          },
        ),
      ),
    );
  }
}
