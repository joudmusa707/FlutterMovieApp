import 'dart:convert';

import 'package:movie_app/models/movie.dart';

class MovieParser {
  static List<Film> parse(String jsonString) {
    final List<dynamic> parsedJsonList = json.decode(jsonString);

    return parsedJsonList
        .map((jsonItem) => Film.fromJson(jsonItem as Map<String, dynamic>))
        .toList();
  }
}
