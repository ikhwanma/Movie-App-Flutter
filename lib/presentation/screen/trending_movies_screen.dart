import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/bloc/trending_movies/trending_movies_bloc.dart';
import 'package:movie_app/presentation/bloc/trending_movies/trending_movies_state.dart';
import 'movie_list.dart';

class TrendingMoviesScreen extends StatelessWidget {
  const TrendingMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TrendingMoviesBloc, TrendingMoviesState>(
        builder: (context, state) {
          switch(state){
            case TrendingMoviesLoading _:
              return Container(
                  decoration: const BoxDecoration(color: Colors.black),
                  child: Stack(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(
                              top: 60, left: 15, right: 15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height / 1,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15, left: 20),
                        child: const Text("Movie App",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                                fontWeight: FontWeight.bold)
                        ),
                      )
                    ],
                  ));
            case TrendingMoviesLoaded _:
              return Container(
                  decoration: const BoxDecoration(color: Colors.black),
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            top: 60, left: 15, right: 15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: MovieList(movies: state.movies),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15, left: 20),
                        child: const Text("Movie App",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                                fontWeight: FontWeight.bold)
                        ),
                      )
                    ],
                  ));
            case TrendingMoviesError _:
              return Text(state.message);
          }
          return Container();
        },
      ),
    );
  }
}
