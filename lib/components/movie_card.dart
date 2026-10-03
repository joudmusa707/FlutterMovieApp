import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/routes/movies_details.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
    this.isDetailedView = false,
  });

  final Film movie;
  final bool isDetailedView;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(movie.title),
        subtitle: Text("Director: ${movie.director}"),
        leading: CircleAvatar(backgroundImage: NetworkImage(movie.images[0])),
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 75.0, bottom: 10.0),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text: "Release Year: ",
                        style: Theme.of(context).textTheme.labelLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: "${movie.year} \n\n"),
                      TextSpan(
                        text: "Synopsis: ",
                        style: Theme.of(context).textTheme.labelLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: "${movie.synopsis} \n"),
                    ],
                  ),
                ),
                isDetailedView
                    ? Text("")
                    : TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MoviesDetails(movie: movie),
                            ),
                          );
                        },
                        child: Text("Read More"),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
