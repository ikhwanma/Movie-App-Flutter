import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/data/datasources/movie_remote_data_source.dart';
import 'package:movie_app/data/models/movie_model.dart';

import '../../../core/errors/server_exception.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource{

  final http.Client client;

  MovieRemoteDataSourceImpl({required this.client});

  static const BASE_URL = "https://api.themoviedb.org/3";
  static const API_KEY = "63be5170b074455a7fba3a528aeea4ce";


  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await client.get(
      Uri.parse("$BASE_URL/movie/popular?api_key=$API_KEY")
    );

    if(response.statusCode == 200){
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies = (responseBody['results'] as List)
      .map((movie) => MovieModel.fromJson(movie))
      .toList();
      return movies;
    }else{
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getTrendingMovies() async {
    final response = await client.get(
        Uri.parse("$BASE_URL/trending/movie/day?api_key=$API_KEY")
    );

    if(response.statusCode == 200){
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies = (responseBody['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    }else{
      throw ServerException();
    }
  }

}