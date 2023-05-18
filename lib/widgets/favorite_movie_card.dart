import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
    return Container(
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
          SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(title),
              Wrap(
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
    );
  }
}
