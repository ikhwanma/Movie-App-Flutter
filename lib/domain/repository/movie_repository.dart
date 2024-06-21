import 'package:movie_app/domain/entity/Movie.dart';
import 'package:dartz/dartz.dart';

import '../../core/errors/server_failure.dart';

abstract class MovieRepository{
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTrendingMovies();
}