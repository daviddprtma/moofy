import 'package:flutter/material.dart';
import 'package:moofy/models/movie.dart';

class MoviesFilter extends StatefulWidget {
  MoviesFilter(
      {super.key,
      required this.topRatedMovies,
      required this.nowPlayingMovies,
      required this.popularMovies,
      required this.upcomingMovies,
      required this.currentMovies,
      required this.callback,
      this.selectedFilterIdx = 0});
  final List<Movie> topRatedMovies;
  final List<Movie> nowPlayingMovies;
  final List<Movie> popularMovies;
  final List<Movie> upcomingMovies;
  final List<Movie> currentMovies;
  final Function callback;
  int selectedFilterIdx;
  @override
  State<StatefulWidget> createState() => _MoviesFilterState();
}

class _MoviesFilterState extends State<MoviesFilter> {
  List<Movie> movies = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.callback(0, widget.popularMovies);
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade800),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Popular',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: widget.selectedFilterIdx == 0
                          ? Color(0XFFE2B616)
                          : Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.callback(1, widget.nowPlayingMovies);
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade800),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Now Playing',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: widget.selectedFilterIdx == 1
                          ? Color(0XFFE2B616)
                          : Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.callback(2, widget.upcomingMovies);
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade800),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Upcoming',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: widget.selectedFilterIdx == 2
                          ? Color(0XFFE2B616)
                          : Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.callback(3, widget.topRatedMovies);
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade800),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Top Rated',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: widget.selectedFilterIdx == 3
                          ? Color(0XFFE2B616)
                          : Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
          ],
        ),
      ),
    );
  }
}
