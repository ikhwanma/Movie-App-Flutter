import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/bloc/trending_movies/trending_movies_bloc.dart';
import 'package:movie_app/presentation/bloc/trending_movies/trending_movies_event.dart';
import 'package:movie_app/presentation/screen/trending_movies_screen.dart';

import '../../injection_container.dart';

class TrendingMoviesProvider extends StatelessWidget {
  const TrendingMoviesProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<TrendingMoviesBloc>()..add(FetchTrendingMovies()),
        child: const SafeArea(child: TrendingMoviesScreen()),
      ),
    );
  }
}
