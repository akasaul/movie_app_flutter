import '../models/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MoviesRepository {
  Future<List<Movie>?> fetchMovies(
      String path, Map<String, String> params) async {
    Uri url = Uri.https(
      'api.themoviedb.org',
      path,
      params,
    );

    try {
      final res = await http.get(url, headers: {
        'accept': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlZGY5ZjEwMzdkN2YzNzhhMWMxYzk0YjY1Y2VhOThkNCIsInN1YiI6IjYzOWFiOTExOGEwZTliMDA4YWY3NTcwMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lQkN6XFyQHRrHKj3TI2XDbJ-bnN3FIUhlg56CxJBHXs'
      });

      final resFormatted = (json.decode(res.body));

      if (resFormatted['results'].length > 0) {
        return List<Movie>.from(resFormatted['results']
            .map((movie) => Movie(
                  title: movie['original_title'] ?? movie['name'],
                  id: movie['id'],
                  genreIds: movie['genre_ids'],
                  rating: movie['vote_average'].toString(),
                  posterPath: movie['poster_path'],
                ))
            .toList());
      }
    } catch (err) {
      throw Exception('Could not fetch data.');
    }
  }

  Future<List<Movie>?> search(String query) async {
    Uri url = Uri.https(
      'api.themoviedb.org',
      '3/search/multi',
      {
        'include_adult': 'false',
        'language': 'en-US',
        'query': query,
        'page': '1',
      },
    );

    try {
      final res = await http.get(
        url,
        headers: {
          'accept': 'application/json',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlZGY5ZjEwMzdkN2YzNzhhMWMxYzk0YjY1Y2VhOThkNCIsInN1YiI6IjYzOWFiOTExOGEwZTliMDA4YWY3NTcwMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lQkN6XFyQHRrHKj3TI2XDbJ-bnN3FIUhlg56CxJBHXs'
        },
      );

      final resFormatted = (json.decode(res.body));

      if (resFormatted['results'].length > 0) {
        //     .map((res) => (res['poster_path']) == null)
        //     .toList());
        return List<Movie>.from(resFormatted['results']
            .map((movie) => Movie(
                  title: movie['original_title'] ?? movie['name'],
                  id: movie['id'],
                  genreIds: movie['genre_ids'],
                  rating: movie['vote_average'].toString(),
                  posterPath: movie['poster_path'] ??
                      'https://img.freepik.com/premium-vector/film-strip-isolated-black-background_305440-552.jpg?w=996',
                ))
            .toList());
      }
    } catch (err) {
      print(err);
      throw Exception('Could not fetch data.');
    }
  }
}

// const options = {
//   method: 'GET',
//   headers: {
//     accept: 'application/json',
//     Authorization: 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlZGY5ZjEwMzdkN2YzNzhhMWMxYzk0YjY1Y2VhOThkNCIsInN1YiI6IjYzOWFiOTExOGEwZTliMDA4YWY3NTcwMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lQkN6XFyQHRrHKj3TI2XDbJ-bnN3FIUhlg56CxJBHXs'
//   }
// };

// fetch('https://api.themoviedb.org/3/search/multi?include_adult=false&language=en-US&page=1', options)
//   .then(response => response.json())
//   .then(response => console.log(response))
//   .catch(err => console.error(err));