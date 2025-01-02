import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moofy/models/movie.dart';
import 'package:moofy/responsive.dart';

class PopularMoviesView extends StatefulWidget {
  final List<Movie> popularMovies;

  const PopularMoviesView({super.key, required this.popularMovies});

  @override
  State<PopularMoviesView> createState() => _PopularMoviesViewState();
}

class _PopularMoviesViewState extends State<PopularMoviesView> {
  int? _hoverIndex;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: Responsive().isMobile(context)
                ? 2
                : Responsive().isTablet(context)
                    ? 3
                    : 5,
            childAspectRatio: 0.8),
        itemCount: widget.popularMovies.length,
        itemBuilder: (context, index) {
          final movie = widget.popularMovies[index];
          return MouseRegion(
            onEnter: (_) {
              setState(() {
                _hoverIndex = index;
              });
            },
            onExit: (_) {
              setState(() {
                _hoverIndex = null;
              });
            },
            child: AnimatedContainer(
              duration: Duration(
                milliseconds: 200,
              ),
              transform: _hoverIndex == index
                  ? (Matrix4.identity()
                    ..scale(1.05, 1.05)
                    ..translate(0, -10))
                  : Matrix4.identity(),
              child: GestureDetector(
                onTap: () {
                  context.go('/movie/${movie.id}');
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Card(
                    elevation: _hoverIndex == index ? 20 : 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8)),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 200,
                          ),
                        )),
                        Expanded(
                            child: ListView(
                          padding: EdgeInsets.all(8),
                          children: [
                            Text(
                              movie.title,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.yellow),
                                Text(movie.voteCount.toString())
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Language: ${movie.originalLanguage}',
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              'Adult: ${movie.adult ? 'Yes' : 'No'}',
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
