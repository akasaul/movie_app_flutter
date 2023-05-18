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
    return Container(
      height: 200,
      width: double.infinity,
      child: Row(
        children: [
          Image.network(
            'https://image.tmdb.org/t/p/original/${image}',
            fit: BoxFit.cover,
            loadingBuilder: (ctx, child, chunk) => Container(
              color: Colors.red,
              child: child,
            ),
            alignment: Alignment.centerLeft,
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
