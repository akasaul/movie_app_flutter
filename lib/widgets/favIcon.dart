import 'package:flutter/material.dart';
import '../models/movie.dart';
import 'dart:convert';
import '../services/movie_services.dart';

class FavIcon extends StatefulWidget {
  final Movie movie;

  const FavIcon(this.movie);

  @override
  State<FavIcon> createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon> {
  bool isFav = false;
  bool isInit = false;
  bool isCheckingFav = true;
  MovieServices _movieServices = MovieServices();

  Future<bool> getIsFav() async {
    return await _movieServices.isFavorite('favorite_movies', widget.movie.id);
  }

  @override
  void initState() {
    getIsFav().then((value) {
      setState(() {
        isFav = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 10,
      icon: isFav
          ? Icon(
              Icons.bookmark_added,
              color: Theme.of(context).colorScheme.tertiary,
              size: 32,
            )
          : Icon(
              Icons.bookmark,
              color: Colors.black,
              size: 32,
            ),
      onPressed: () async {
        try {
          if (!isFav) {
            setState(() {
              isFav = true;
            });
            await _movieServices.addToFavorites('favorite_movies', {
              'id': widget.movie.id,
              'title': widget.movie.title,
              'image': widget.movie.posterPath,
              'genre': json.encode(widget.movie.genreIds),
              'rating': widget.movie.rating,
            });
          } else {
            setState(() {
              isFav = false;
            });
            await _movieServices.removeFromFavorites(
                'favorite_movies', widget.movie.id);
          }
        } catch (err) {
          print(err);
          setState(() {
            isFav = !isFav;
          });
        }
      },
    );
  }
}
