import 'package:flutter/material.dart';
import '../widgets/search_bar.dart';

class Filters extends StatelessWidget {
  const Filters({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120), // Set this height
        child: Container(
          width: MediaQuery.of(context).size.width - 125,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Color.fromARGB(93, 161, 160, 160),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.search,
                size: 20,
              ),
              const SizedBox(width: 10),
              // Text(
              //   'Find movies, TV shows and more',
              //   style: Theme.of(context).textTheme.bodySmall,
              // ),
            ],
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        color: Theme.of(context).colorScheme.background,
      ),
    );
  }
}
