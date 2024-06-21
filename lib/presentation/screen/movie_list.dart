import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/presentation/screen/detail_movie_screen.dart';

import '../../domain/entity/Movie.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  const MovieList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 230,
            mainAxisSpacing: 5,
        ),
        itemCount: movies.length,
        itemBuilder: (context, i) {
          final movie = movies[i];
          return GestureDetector(
            onTap: () => {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailMovieScreen(movie: movie)))
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  IntrinsicWidth(
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Image.network(
                            "https://image.tmdb.org/t/p/w500/${movie
                                .posterPath}",
                            height: 180.0,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      height: 40,
                      alignment: Alignment.center,
                      child: Text(
                        movie.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ))
                ],
              ),
            )
          );
        });
  }
}
