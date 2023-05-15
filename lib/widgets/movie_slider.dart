import 'package:flutter/material.dart';
import '../widgets/movie_slider_single.dart';

class MovieSlider extends StatelessWidget {
  MovieSlider({super.key});

  final carousel = [
    MovieSliderSingle(
      imageUrl:
          'https://resize.indiatvnews.com/en/resize/newbucket/730_-/2022/11/john-wick-1668095706.jpg',
    ),
    MovieSliderSingle(
      imageUrl:
          'https://s.yimg.com/ny/api/res/1.2/NShuU3coiFRZ3.Egqvyfpw--/YXBwaWQ9aGlnaGxhbmRlcjt3PTk2MDtoPTYzODtjZj13ZWJw/https://media.zenfs.com/en/homerun/feed_manager_auto_publish_494/27de58fc6b09e916c81a3faf061550de',
    ),
    MovieSliderSingle(
      imageUrl:
          'https://resize.indiatvnews.com/en/resize/newbucket/730_-/2022/11/john-wick-1668095706.jpg',
    ),
    MovieSliderSingle(
      imageUrl:
          'https://s.yimg.com/ny/api/res/1.2/NShuU3coiFRZ3.Egqvyfpw--/YXBwaWQ9aGlnaGxhbmRlcjt3PTk2MDtoPTYzODtjZj13ZWJw/https://media.zenfs.com/en/homerun/feed_manager_auto_publish_494/27de58fc6b09e916c81a3faf061550de',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        children: [
          PageView.builder(
            onPageChanged: (curIndex) => {print(curIndex)},
            itemCount: carousel.length,
            itemBuilder: (ctx, index) => MovieSliderSingle(
              imageUrl: carousel[index].imageUrl,
            ),
          ),
          Positioned(
            bottom: 5,
            right: 0,
            child: Wrap(
              spacing: 10,
              children: [
                positionIndicatorBuilder(false),
                positionIndicatorBuilder(true),
                positionIndicatorBuilder(false),
                positionIndicatorBuilder(false),
                positionIndicatorBuilder(false),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget positionIndicatorBuilder(bool isActive) {
  return Container(
    height: 5,
    width: isActive ? 12 : 5,
    decoration: const BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.all(Radius.circular(2))),
  );
}
