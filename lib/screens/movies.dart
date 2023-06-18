import 'package:flutter/material.dart';
import '../widgets/movie_slider.dart';
import '../widgets/button.dart';
import '../widgets/movies_section.dart';
import '../widgets/search_bar.dart';
import './bookmarks_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String routeName = 'movies';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120), // Set this height
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 20,
          ),
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('NikoFlex'),
              const SearchBar('Spiderman no way home'),
              IconButton(
                icon: const Icon(Icons.dark_mode),
                color: Colors.red,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MovieSlider(),
            Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button(
                    icon: Icons.history,
                    title: 'History',
                    color: Colors.purple,
                    route: '/bookmarks',
                  ),
                  Button(
                    icon: Icons.book,
                    title: 'Bookmark',
                    color: Theme.of(context).colorScheme.tertiary,
                    route: BookmarksScreen.routeName,
                  ),
                  Button(
                    icon: Icons.search,
                    title: 'Search',
                    color: Colors.blue,
                    route: '/bookmarks',
                  ),
                  Button(
                    icon: Icons.category,
                    title: 'Filters',
                    color: Colors.green,
                    route: '/bookmarks',
                  ),
                ],
              ),
            ),
            MoviesSection(),
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
    );
  }
}
