import 'package:flutter/material.dart';
import '../services/movie_services.dart';
import 'dart:convert';
import '../widgets/favorite_movie_card.dart';

class BookmarksScreen extends StatelessWidget {
  BookmarksScreen({super.key});

  static const routeName = 'bookmarks';

  MovieServices _movieServices = MovieServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'My Favorites',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        body:
            //  Column(
            //   children: [
            //     FavoriteMovieCard(),
            //   ],
            // ),
            // Text('bookmards', style: TextStyle(color: Colors.red))
            SingleChildScrollView(
          child: FutureBuilder(
              future: _movieServices.getFavorites('favorite_movies'),
              builder: (ctx, snapshot) => snapshot.connectionState ==
                      ConnectionState.done
                  ? Container(
                      height: 600,
                      child: ListView.builder(
                        padding: EdgeInsets.all(10),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (ctx, index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: FavoriteMovieCard(
                            image: snapshot.data!.elementAt(index)['image'],
                            genres: snapshot.data!.elementAt(index)['genre'],
                            title: snapshot.data!.elementAt(index)['title'],
                            rating: snapshot.data!.elementAt(index)['rating'],
                          ),
                        ),
                      ),
                    )
                  : Text('Waiting')),
        ));
  }
}
