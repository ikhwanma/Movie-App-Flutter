import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/injection_container.dart';
import '../bloc/popular_movies/popular_movies_bloc.dart';
import '../bloc/popular_movies/popular_movies_event.dart';
import '../screen/popular_movies_screen.dart';

class PopularMoviesProvider extends StatelessWidget {
  const PopularMoviesProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<PopularMoviesBloc>()..add(FetchPopularMovies()),
        child: const SafeArea(child: PopularMoviesScreen()),
      ),
    );
  }
}
