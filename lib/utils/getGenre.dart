final genres = [
  {"id": 28, "name": "Action"},
  {"id": 12, "name": "Adventure"},
  {"id": 16, "name": "Animation"},
  {"id": 35, "name": "Comedy"},
  {"id": 80, "name": "Crime"},
  {"id": 99, "name": "Documentary"},
  {"id": 18, "name": "Drama"},
  {"id": 10751, "name": "Family"},
  {"id": 14, "name": "Fantasy"},
  {"id": 36, "name": "History"},
  {"id": 27, "name": "Horror"},
  {"id": 10402, "name": "Music"},
  {"id": 9648, "name": "Mystery"},
  {"id": 10749, "name": "Romance"},
  {"id": 878, "name": "Science Fiction"},
  {"id": 10770, "name": "TV Movie"},
  {"id": 53, "name": "Thriller"},
  {"id": 10752, "name": "War"},
  {"id": 37, "name": "Western"}
];

String getMovieGenre(int id) {
  final res = genres.where((genre) => genre['id'] == id).toList()[0];
  return res['name'] as String;
}

List<String> getMovieGenres(List<dynamic> ids) {
  final res = ids
      .map((id) => genres.where((genre) => genre['id'] == id).toList())
      .toList();

  final genreList = res.map((item) => item[0]['name'] as String).toList();
  return genreList as List<String>;
}
