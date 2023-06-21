import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FavoriteMovieCard extends StatelessWidget {
  final String image;
  final String rating;
  final String genres;
  final String title;

  FavoriteMovieCard({
    required this.image,
    required this.rating,
    required this.genres,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final genresArray = genres.substring(1, genres.length - 2).split(',');

    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: 'https://image.tmdb.org/t/p/original/${image}',
                fit: BoxFit.cover,
                progressIndicatorBuilder: (ctx, child, chunk) => Container(
                  color: Colors.red,
                  alignment: Alignment.centerLeft,
                ),
              ),
              // Image.network(
              //   'https://image.tmdb.org/t/p/original/${image}',
              //   fit: BoxFit.cover,
              //   loadingBuilder: (ctx, child, chunk) => Container(
              //     color: Colors.red,
              //     child: child,
              //   ),
              //   alignment: Alignment.centerLeft,
              // ),
              SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Text(title.length < 15
                        ? title
                        : title.substring(0, 15) + '...'),
                    fit: BoxFit.contain,
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 10,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text(rating),
                    ],
                  ),
                  Text(genres),
                ],
              )
            ],
          ),
        ),
        Divider(
          color: Colors.grey,
        ),
      ],
    );
  }
}
