import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../repository/DB_helper.dart';
import 'dart:convert';

class FavIcon extends StatefulWidget {
  final Movie movie;

  const FavIcon(this.movie);

  @override
  State<FavIcon> createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon> {
  bool isFav = false;
  bool isInit = false;

  Future<bool> getIsFav() async {
    return await DBHelper.checkFavorite('favorite_movies', widget.movie.id);
  }

  @override
  void initState() {
    getIsFav().then((value) => setState(() {
          isFav = value;
        }));
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
        setState(() {
          isFav = !isFav;
        });
        try {
          if (!isFav) {
            await DBHelper.insert('favorite_movies', {
              'id': widget.movie.id,
              'title': widget.movie.title,
              'image': widget.movie.posterPath,
              'genre': json.encode(widget.movie.genreIds),
              'rating': widget.movie.rating,
            });
          } else {
            await DBHelper.removeData('favorite_movies', widget.movie.id);
          }
        } catch (err) {
          print(err);
          setState(() {
            isFav = !isFav;
          });
        }

        print(await DBHelper.getData('favorite_movies'));
      },
    );
  }
}
