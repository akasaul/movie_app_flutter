import 'package:flutter/material.dart';
import 'movie_card.dart';
import '../models/movie.dart';

class MovieGrid extends StatelessWidget {
  final String sectionTitle;
  final List<Movie> movieList;

  MovieGrid({
    super.key,
    required this.sectionTitle,
    required this.movieList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  sectionTitle,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Icon(Icons.expand_less),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              constraints: BoxConstraints(maxHeight: 420),
              child: GridView.count(
                padding: EdgeInsets.all(0),
                childAspectRatio: 0.52,
                crossAxisCount: 3,
                mainAxisSpacing: 7,
                crossAxisSpacing: 7,
                children: movieList
                    .map((movieItem) => MovieCard(
                          movie: movieItem,
                        ))
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
