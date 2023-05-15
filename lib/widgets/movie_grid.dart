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
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        constraints: BoxConstraints(maxHeight: 500),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  sectionTitle,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Icon(Icons.expand_less),
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: 400,
              child: GridView.count(
                childAspectRatio: 2 / 3.8,
                crossAxisCount: 3,
                mainAxisSpacing: 7,
                crossAxisSpacing: 7,
                children: movieList
                    .map((movieItem) => MovieCard(
                          movie: movieItem,
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
