import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/utils/movie_parser.dart';

class MovieProvider extends ChangeNotifier {
  List<Film> _movieList = [
    // "Pulp Movie",
    // "The lord of the rings",
    // "Harry Potter",
    // "Pulp Movie",
    // "The god father",
    // "Harry Potter",
  ];
  List<Film> get movieList => _movieList;
  // List<String> loadMovies() {
  //   return _movieList;
  // }

  Future<void> loadMovies(BuildContext context) async {
    try {
      final josnString = await DefaultAssetBundle.of(context)
          .loadString('assets/data/films.json');
      final movies = MovieParser.parse(josnString);
      _movieList = movies;
      notifyListeners();
    } catch (e) {
      print("Error loading movies: $e");
    }
  }
}
