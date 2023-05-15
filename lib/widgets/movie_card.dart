import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
          ),
          child: Container(
            decoration: const BoxDecoration(
                // color: Colors.white,
                ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Image.network(
                    'https://image.tmdb.org/t/p/original/${movie.posterPath}',
                    fit: BoxFit.cover,
                    loadingBuilder: (ctx, child, chunk) => Container(
                      color: Colors.red,
                      child: child,
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                ),
                Container(
                  color: Theme.of(context).colorScheme.secondary,
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 12,
                            color: Colors.amber,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            movie.rating,
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        movie.title,
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const Positioned(
          top: 0,
          child: Icon(
            Icons.bookmark_add,
            color: Colors.black,
            size: 32,
          ),
        )
      ],
    );
  }
}
