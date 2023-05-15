import 'package:flutter/material.dart';

class MovieSliderSingle extends StatelessWidget {
  final String imageUrl;

  MovieSliderSingle({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300,
          width: 500,
          color: Colors.red,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            loadingBuilder: (ctx, child, chunk) => Container(
              color: Colors.red,
              child: child,
            ),
            alignment: Alignment.centerLeft,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            height: 50,
            // color: const Color.fromARGB(157, 41, 41, 41),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Fantasy',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    SizedBox(width: 15),
                    Text(
                      'United States',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    Spacer(),
                    Container(
                      height: 20,
                      width: 20,
                      child: Icon(Icons.play_arrow),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Avatar 2',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ],
            ),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 30,
                  spreadRadius: 10,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
