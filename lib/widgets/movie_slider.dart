import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/movie_slider_single.dart';
import '../providers/movies_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MovieSlider extends StatefulWidget {
  MovieSlider({super.key});

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  int cur = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Consumer<MoviesProvider>(
          builder: (ctx, moviesProvider, child) => FutureBuilder(
            future: moviesProvider.fetchAndSetPopularMovies(),
            builder: (ctx, snapshot) =>
                snapshot.connectionState == ConnectionState.waiting
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.amber),
                      )
                    : snapshot.connectionState == ConnectionState.done &&
                            snapshot.error == null
                        ? CarouselSlider(
                            options: CarouselOptions(
                              height: 350.0,
                              autoPlay: true,
                              enlargeCenterPage: true,
                            ),
                            items: snapshot.data?.sublist(0, 5).map((movie) {
                              return MovieSliderSingle(movie: movie);
                            }).toList(),
                          )
                        : Container(
                            height: 350.0,
                            child: Center(
                              child: Text(
                                'Error Happed Could not connect',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 10,
          child: Wrap(
            spacing: 10,
            children: [
              positionIndicatorBuilder(false),
              positionIndicatorBuilder(false),
              positionIndicatorBuilder(false),
              positionIndicatorBuilder(false),
              positionIndicatorBuilder(false),
            ],
          ),
        )
      ],
    );
  }
}

Widget positionIndicatorBuilder(bool isActive) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 300),
    height: 5,
    width: isActive ? 12 : 5,
    decoration: const BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.all(
        Radius.circular(2),
      ),
    ),
  );
}
