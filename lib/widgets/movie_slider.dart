import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/movie_slider_single.dart';
import '../providers/movies_provider.dart';

class MovieSlider extends StatefulWidget {
  MovieSlider({super.key});

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  int cur = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        children: [
          FutureBuilder(
            future: Provider.of<MoviesProvider>(context, listen: false)
                .fetchAndSetPopularMovies(),
            builder: (ctx, snapshot) => Consumer<MoviesProvider>(
              builder: (ctx, moviesProvider, child) => PageView.builder(
                  pageSnapping: true,
                  onPageChanged: (curIndex) => {
                        setState(() {
                          cur = curIndex;
                        })
                      },
                  itemCount: moviesProvider.movies.length,
                  itemBuilder: (ctx, index) => MovieSliderSingle(
                      movie: moviesProvider.movies.elementAt(index))),
            ),
          ),
          Positioned(
            bottom: 5,
            right: 0,
            child: Wrap(
              spacing: 10,
              children: [
                positionIndicatorBuilder(cur == 0),
                positionIndicatorBuilder(cur == 1),
                positionIndicatorBuilder(cur == 2),
                positionIndicatorBuilder(cur == 3),
                positionIndicatorBuilder(cur == 4),
              ],
            ),
          )
        ],
      ),
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
