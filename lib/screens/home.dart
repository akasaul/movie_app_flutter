import 'package:flutter/material.dart';
import '../widgets/movie_slider.dart';
import '../widgets/movie_grid.dart';
import '../widgets/button.dart';

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
            Container(
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button(
                    icon: Icons.history,
                    title: 'History',
                    color: Colors.purple,
                  ),
                  Button(
                    icon: Icons.book,
                    title: 'Bookmark',
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  Button(
                    icon: Icons.search,
                    title: 'Search',
                    color: Colors.blue,
                  ),
                  Button(
                    icon: Icons.category,
                    title: 'Filters',
                    color: Colors.green,
                  ),
                ],
              ),
            ),
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
