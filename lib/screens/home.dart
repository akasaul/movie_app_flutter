import 'package:flutter/material.dart';
import '../screens/movies.dart';
import '../screens/filters.dart';
import '../screens/me.dart';

class Home extends StatefulWidget {
  final String title;
  Home({super.key, required this.title});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int page = 0;

  final pages = [
    HomePage(),
    Filters(),
    Me(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 50,
        child: BottomNavigationBar(
          onTap: (index) => {
            setState(() {
              page = index;
            })
          },
          currentIndex: page,
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
      body: pages[page],
    );
  }
}
