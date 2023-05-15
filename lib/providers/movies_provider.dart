import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/movie.dart';

class MoviesProvider with ChangeNotifier {
  List<Movie> movies = [];

  Future<void> fetchAndSetMovies() async {
    Uri url = Uri.https(
      'api.themoviedb.org',
      '3/movie/popular',
      {
        'language': 'en-US',
        'page': '1',
      },
    );

    try {
      final res = await http.get(url, headers: {
        'accept': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlZGY5ZjEwMzdkN2YzNzhhMWMxYzk0YjY1Y2VhOThkNCIsInN1YiI6IjYzOWFiOTExOGEwZTliMDA4YWY3NTcwMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lQkN6XFyQHRrHKj3TI2XDbJ-bnN3FIUhlg56CxJBHXs'
      });

      final resFormatted = (json.decode(res.body));

      if (resFormatted['results'].length > 0) {
        movies = List<Movie>.from(resFormatted['results']
            .map((movie) => Movie(
                  title: movie['original_title'],
                  id: movie['id'],
                  genreIds: movie['genre_ids'],
                  rating: movie['vote_average'].toString(),
                  posterPath: movie['poster_path'],
                ))
            .toList());

        notifyListeners();
      }
    } catch (err) {
      print(err);
    }
  }
}
