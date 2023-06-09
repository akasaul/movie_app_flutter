import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../repository/movies_repo.dart';

class MoviesProvider with ChangeNotifier {
  List<Movie> _movies = [];
  MoviesRepository _movieRepo = MoviesRepository();

  List<Movie> get movies {
    return List.unmodifiable(_movies);
  }

  Future<List<Movie>> fetchAndSetPopularMovies() async {
    return await _movieRepo.fetchMovies(
      '3/movie/popular',
      {
        'language': 'en-US',
        'page': '1',
      },
    ) as List<Movie>;
  }

  Future<List<Movie>> fetchTrendingMovies() async {
    final trendingMovies =
        await _movieRepo.fetchMovies('3/trending/movie/day', {
      'language': 'en-US',
    });
    return trendingMovies as List<Movie>;
  }

  Future<List<Movie>> fetchTrendingTv() async {
    final trendingMovies = await _movieRepo.fetchMovies('3/trending/tv/day', {
      'language': 'en-US',
    });

    return trendingMovies as List<Movie>;
  }

  Future<List<Movie?>> search(String query) async {
    final searchResult = await _movieRepo.search(query);
    if (searchResult != null && searchResult.length > 0) {
      return searchResult as List<Movie>;
    }
    return [];
  }
}
