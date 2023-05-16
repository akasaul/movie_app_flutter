import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String placeholder;
  const SearchBar(this.placeholder);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 125,
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Color.fromARGB(93, 161, 160, 160),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'N',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            placeholder,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Icon(
            Icons.search,
            size: 20,
          )
        ],
      ),
    );
  }
}
