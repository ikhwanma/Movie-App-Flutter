import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/data/datasources/movie_remote_data_source.dart';
import 'package:movie_app/data/datasources/remote/movie_remote_data_source_impl.dart';
import 'package:movie_app/data/repository/movie_repository_impl.dart';
import 'package:movie_app/domain/repository/movie_repository.dart';
import 'package:movie_app/domain/usecases/get_popular_movies.dart';
import 'package:movie_app/domain/usecases/get_trending_movies.dart';
import 'package:movie_app/presentation/bloc/landing_page/landing_page_bloc.dart';
import 'package:movie_app/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:movie_app/presentation/bloc/trending_movies/trending_movies_bloc.dart';

final getIt = GetIt.instance;

void init(){
  //Bloc
  getIt.registerFactory(() => PopularMoviesBloc(getPopularMovies: getIt()));
  getIt.registerFactory(() => TrendingMoviesBloc(getTrendingMovies: getIt()));
  getIt.registerFactory(() => LandingPageBloc());

  //Use cases
  getIt.registerLazySingleton(() => GetPopularMovies(getIt()));
  getIt.registerLazySingleton(() => GetTrendingMovies(getIt()));

  //Repositories
  getIt.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(remoteDataSource: getIt()));

  //Data sources
  getIt.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(client:  getIt()));

  //Http service
  getIt.registerLazySingleton(() => http.Client());
}