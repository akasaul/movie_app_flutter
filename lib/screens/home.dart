import 'package:flutter/material.dart';
import '../widgets/movie_slider.dart';
import '../widgets/button.dart';
import '../widgets/movies_section.dart';

class Home extends StatelessWidget {
  final String title;
  Home({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 50,
        child: BottomNavigationBar(
          currentIndex: 1,
          unselectedItemColor: Colors.grey,
          backgroundColor: Theme.of(context).colorScheme.surface,
          selectedItemColor: Color.fromARGB(255, 235, 232, 232),
          iconSize: 20,
          unselectedFontSize: 11,
          selectedFontSize: 11,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.home_outlined,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Filter',
              icon: Icon(
                Icons.filter,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Me',
              icon: Icon(
                Icons.account_box,
              ),
            )
          ],
        ),
      ),
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
            MoviesSection(),
          ],
        ),
      ),
    );
  }
}
