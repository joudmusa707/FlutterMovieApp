class Film {
  final int id;
  final String title;
  final int year;
  final String director;
  final List<String> genres;
  final double rating;
  final int runtimeMinutes;
  final List<String> cast;
  final String synopsis;
  final List<String> images;

  const Film({
    required this.id,
    required this.title,
    required this.year,
    required this.director,
    required this.genres,
    required this.rating,
    required this.runtimeMinutes,
    required this.cast,
    required this.synopsis,
    required this.images,
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      id: json['id'] as int,
      title: json['title'] as String,
      year: json['year'] as int,
      director: json['director'] as String,
      genres: List<String>.from(json['genres'] as List),
      images: List<String>.from(json['images'] as List),
      // .toDouble() safely handles numbers represented as int (e.g., 9 instead of 9.0)
      rating: (json['rating'] as num).toDouble(),
      runtimeMinutes: json['runtimeMinutes'] as int,
      cast: List<String>.from(json['cast'] as List),
      synopsis: json['synopsis'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'year': year,
      'director': director,
      'genres': genres,
      'rating': rating,
      'runtimeMinutes': runtimeMinutes,
      'cast': cast,
      'synopsis': synopsis,
    };
  }

  Film copyWith({
    int? id,
    String? title,
    int? year,
    String? director,
    List<String>? genres,
    double? rating,
    int? runtimeMinutes,
    List<String>? cast,
    String? synopsis,
    List<String>? images,
  }) {
    return Film(
      id: id ?? this.id,
      title: title ?? this.title,
      year: year ?? this.year,
      director: director ?? this.director,
      genres: genres ?? this.genres,
      rating: rating ?? this.rating,
      runtimeMinutes: runtimeMinutes ?? this.runtimeMinutes,
      cast: cast ?? this.cast,
      synopsis: synopsis ?? this.synopsis,
      images: images ?? this.images,
    );
  }
}
