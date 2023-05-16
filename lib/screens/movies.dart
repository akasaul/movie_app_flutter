import 'package:flutter/material.dart';
import '../widgets/movie_slider.dart';
import '../widgets/button.dart';
import '../widgets/movies_section.dart';
import '../widgets/search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120), // Set this height
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('NikoFlex'),
              SearchBar('Spiderman no way home'),
              IconButton(
                icon: const Icon(Icons.dark_mode),
                color: Colors.red,
                onPressed: () {},
              ),
            ],
          ),
          color: Colors.transparent,
        ),
      ),
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
            MoviesSection(),
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
    );
  }
}
