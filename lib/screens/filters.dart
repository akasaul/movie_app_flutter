import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movies_provider.dart';
import '../models/movie.dart';
import '../widgets/movie_card.dart';

class Filters extends StatefulWidget {
  const Filters({super.key});

  static String routeName = 'filters';

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  String _query = '';
  List<Movie> _searchRes = [];
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60), // Set this height
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
              Icon(
                Icons.search,
                size: 20,
              ),
              SizedBox(width: 10),
              Consumer<MoviesProvider>(
                builder: (ctx, moviesProvider, child) => Container(
                  width: 200,
                  child: TextField(
                    onChanged: (txt) async {
                      setState(() {
                        _query = txt;
                        _isLoading = true;
                      });
                      try {
                        final res = await moviesProvider.search(txt);
                        if (res.length > 0) {
                          setState(() {
                            _searchRes = res as List<Movie>;
                          });
                        }
                        setState(() {
                          _isLoading = false;
                        });
                      } catch (err) {
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    },
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: 'Find Movies, TV shows and more',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(bottom: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        color: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            Container(
              // color: Colors.red,
              height: 50,
              width: double.infinity,
            ),
            _isLoading
                ? const SizedBox(
                    height: 500,
                    width: double.infinity,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    ),
                  )
                : Container(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height - 100),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: GridView.builder(
                      itemCount: _searchRes.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.55,
                      ),
                      itemBuilder: (ctx, index) => MovieCard(
                        movie: _searchRes[index],
                        isTv: _searchRes[index].isTvShow,
                      ),
                    ),
                  )

            // MovieGrid(
            //     sectionTitle: 'Movies',
            //     movieList: _searchRes,
            //   )
          ],
        ),
      ),
    );
  }
}
