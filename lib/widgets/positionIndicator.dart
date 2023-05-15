import 'package:flutter/material.dart';

Widget positionIndicatorBuilder(bool isActive) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 300),
    height: 5,
    width: isActive ? 12 : 5,
    decoration: const BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.all(
        Radius.circular(2),
      ),
    ),
  );
}

class PositionIndicator extends StatelessWidget {
  const PositionIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
