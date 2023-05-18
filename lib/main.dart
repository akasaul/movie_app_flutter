import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/movies_provider.dart';
import './screens/home.dart';
import './screens/filters.dart';
import './screens/me.dart';
import './screens/bookmarks_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => MoviesProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appName = 'Custom Themes';

    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        // Define the default brightness and colors.
        primaryColor: Colors.lightBlue[800],

        colorScheme: const ColorScheme.light(
          primary: Colors.red,
        ),

        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          titleMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          displayLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      darkTheme: ThemeData(
        textTheme: ThemeData.dark().textTheme.copyWith(
              labelSmall: const TextStyle(
                color: Colors.white,
                letterSpacing: 0.7,
                fontSize: 11,
                fontWeight: FontWeight.w300,
              ),
              titleSmall: const TextStyle(
                color: Colors.grey,
                letterSpacing: 0.7,
                fontSize: 11,
                fontWeight: FontWeight.w300,
              ),
              titleMedium: const TextStyle(
                color: Colors.white,
                letterSpacing: 0.2,
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ),
            ),
        colorScheme: const ColorScheme.dark(
          primary: Colors.black,
          secondary: Color(0xff171616),
          background: Colors.black,
          tertiary: Colors.red,
        ),
        // colorScheme: Theme.of(context).colorScheme.copyWith(
        //       primary: Colors.red,
        //     ),
      ),
      home: Home(title: 'home'),
      routes: {
        Filters.routeName: (ctx) => Filters(),
        Me.routeName: (ctx) => Me(),
        BookmarksScreen.routeName: (ctx) => BookmarksScreen(),
      },
    );
  }
}
