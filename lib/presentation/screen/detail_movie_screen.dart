import 'package:flutter/material.dart';
import 'package:movie_app/domain/entity/Movie.dart';

class DetailMovieScreen extends StatelessWidget {
  final Movie movie;

  const DetailMovieScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      color: Colors.black26,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 200),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white),
            child: Column(
              children: [
                const SizedBox(height: 150),
                Text(
                  movie.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black,
                      inherit: false),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 30
                  ),
                  child: Text(
                    movie.overview,
                    style: const TextStyle(
                        color: Colors.black, fontSize: 16, inherit: false),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 40),
              alignment: Alignment.topCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(
                  "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
                  height: 300,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              )),
        ],
      ),
    ));
  }
}
