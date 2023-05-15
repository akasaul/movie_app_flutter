import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../repository/movies_repo.dart';

class MoviesProvider with ChangeNotifier {
  List<Movie> _movies = [];
  MoviesRepository movieRepo = MoviesRepository();

  List<Movie> get movies {
    return List.unmodifiable(_movies);
  }

  Future<void> fetchAndSetPopularMovies() async {
    _movies = await movieRepo.fetchMovies(
      '3/movie/popular',
      {
        'language': 'en-US',
        'page': '1',
      },
    ) as List<Movie>;
    notifyListeners();
  }

  Future<List<Movie>> fetchTrendingMovies() async {
    final trendingMovies = await movieRepo.fetchMovies('3/trending/movie/day', {
      'language': 'en-US',
    });
    return trendingMovies as List<Movie>;
  }

  Future<List<Movie>> fetchTrendingTv() async {
    final trendingMovies = await movieRepo.fetchMovies('3/trending/tv/day', {
      'language': 'en-US',
    });

    print(trendingMovies);
    return trendingMovies as List<Movie>;
  }
}
