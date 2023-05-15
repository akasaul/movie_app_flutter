class Movie {
  final String posterPath;
  final String title;
  final String rating;
  final int id;
  final List genreIds;

  Movie({
    required this.title,
    required this.id,
    required this.genreIds,
    required this.rating,
    required this.posterPath,
  });
}

// 
