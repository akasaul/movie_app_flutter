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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sectionTitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Icon(Icons.expand_less),
            ],
          ),
        ),
        const SizedBox(height: 10),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 500,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              itemCount: movieList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.52,
                mainAxisSpacing: 7,
                crossAxisSpacing: 7,
              ),
              itemBuilder: (ctx, index) => MovieCard(movie: movieList[index]),
            ),
          ),
        ),
      ],
    );
  }
}
