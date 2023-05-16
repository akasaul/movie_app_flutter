import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieSliderSingle extends StatelessWidget {
  final Movie movie;

  MovieSliderSingle({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // height: 300,
          width: double.infinity,
          color: Colors.red,
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
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            height: 60,
            // color: const Color.fromARGB(157, 41, 41, 41),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Fantasy',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    SizedBox(width: 15),
                    Text(
                      'United States',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Spacer(),
                    Container(
                      height: 30,
                      width: 30,
                      child: Icon(Icons.play_arrow),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          border: Border.all(
                              color: Color.fromARGB(255, 80, 79, 79)),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      movie.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ],
            ),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 30,
                  spreadRadius: 10,
                )
              ],
            ),
          ),
        ),
        //   Positioned(
        //     top: 20,
        //     right: 0,
        //     left: 0,
        //     bottom: 300,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         Text(
        //           'BOX',
        //           style: TextStyle(
        //             fontSize: 30,
        //             fontWeight: FontWeight.bold,
        //             color: Theme.of(context).colorScheme.tertiary,
        //           ),
        //         ),
        //         Icon(
        //           Icons.movie,
        //           color: Theme.of(context).colorScheme.tertiary,
        //         ),
        //       ],
        //     ),
        //   ),
      ],
    );
  }
}
