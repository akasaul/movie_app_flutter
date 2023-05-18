import 'package:flutter/material.dart';
import '../models/movie.dart';
import './favIcon.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  bool isTv;

  MovieCard({
    super.key,
    required this.movie,
    this.isTv = false,
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
                // CachedNetworkImage(
                //     imageUrl:
                //         'https://image.tmdb.org/t/p/original/${movie.posterPath}',
                //     fit: BoxFit.cover,
                //     progressIndicatorBuilder: (ctx, child, chunk) => Container(
                //       color: Colors.red,
                //       alignment: Alignment.centerLeft,
                //     ),
                //   )
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
                            movie.rating.substring(0, 3),
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
        Positioned(top: 0, left: 0, child: FavIcon(movie))
      ],
    );
  }
}
