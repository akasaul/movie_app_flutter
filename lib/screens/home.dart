import 'package:flutter/material.dart';
import '../widgets/movie_slider.dart';
import '../widgets/movie_grid.dart';

class Home extends StatelessWidget {
  final String title;
  Home({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            MovieSlider(),
            MovieGrid(
              sectionTitle: 'Trending',
            ),
            MovieGrid(
              sectionTitle: 'Trending',
            ),
          ],
        ),
      ),
    );
  }
}
