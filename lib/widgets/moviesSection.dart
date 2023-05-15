import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movies_provider.dart';
import './movie_grid.dart';
import '../models/movie.dart';

class MoviesSection extends StatelessWidget {
  const MoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Consumer<MoviesProvider>(
            builder: (ctx, moviesProvider, child) => FutureBuilder(
              future: moviesProvider.fetchTrendingMovies(),
              builder: (ctx, snapshot) => snapshot.connectionState ==
                      ConnectionState.waiting
                  ? Container(
                      height: 300,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                    )
                  : MovieGrid(
                      sectionTitle: 'Trending Movies',
                      movieList: snapshot.data!.sublist(0, 6) as List<Movie>,
                    ),
            ),
          ),
          Consumer<MoviesProvider>(
            builder: (ctx, moviesProvider, child) => FutureBuilder(
              future: moviesProvider.fetchTrendingTv(),
              builder: (ctx, snapshot) => snapshot.connectionState ==
                      ConnectionState.waiting
                  ? Container(
                      height: 300,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                    )
                  : MovieGrid(
                      sectionTitle: 'Trending TV Shows',
                      movieList: snapshot.data!.sublist(0, 6) as List<Movie>,
                    ),
            ),
          )
        ],
      ),
    );
  }
}
