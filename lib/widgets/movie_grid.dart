import 'package:flutter/material.dart';
import 'movie_card.dart';
import '../models/movie.dart';

class MovieGrid extends StatelessWidget {
  final String sectionTitle;

  MovieGrid({
    super.key,
    required this.sectionTitle,
  });

  final movies = [
    Movie(duration: '2:01', title: 'Title', rating: 8.8),
    Movie(duration: '2:01', title: 'Title', rating: 8.8),
    Movie(duration: '2:01', title: 'Title', rating: 8.8),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
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
            margin: EdgeInsets.only(bottom: 20),
            height: MediaQuery.of(context).size.height - 100,
            child: GridView.count(
              childAspectRatio: 2 / 3,
              crossAxisCount: 3,
              mainAxisSpacing: 7,
              crossAxisSpacing: 7,
              children: [
                MovieCard(),
                MovieCard(),
                MovieCard(),
                MovieCard(),
                MovieCard(),
                MovieCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
