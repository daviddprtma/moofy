import 'package:flutter/material.dart';
import 'package:moofy/models/movie.dart';
import 'package:moofy/services/model_service.dart';
import 'package:moofy/widgets/drawer.dart';
import 'package:moofy/widgets/footer.dart';
import 'package:moofy/widgets/home_widgets/popular_movies_view.dart';
import 'package:moofy/widgets/movie_widgets/movies_filter.dart';
import 'package:moofy/widgets/navbar.dart';
import 'package:moofy/widgets/skeletons/popular_movie_skeleton.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<StatefulWidget> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  List<Movie> _topRatedMovies = [];
  List<Movie> _nowPlayingMovies = [];
  List<Movie> _popularMovies = [];
  List<Movie> _upcomingMovies = [];
  List<Movie> _currentmovies = [];
  int _selectedFilterIdx = 0;
  bool _isLoading = true;

  void callback(int idx, List<Movie> movie) {
    setState(() {
      _selectedFilterIdx = idx;
      _currentmovies = movie;
    });
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    ModelService movieService = ModelService();
    _topRatedMovies = await movieService.fetchtopRatedMovie();
    _nowPlayingMovies = await movieService.fetchNowPlayingMovie();
    _popularMovies = await movieService.fetchPopularMovie();
    _upcomingMovies = await movieService.fetchUpcomingMovie();
    _currentmovies = _popularMovies;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(),
        appBar: const CustomNavbar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                child: Text(
                  'Explore Movies',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              MoviesFilter(
                topRatedMovies: _topRatedMovies,
                nowPlayingMovies: _nowPlayingMovies,
                popularMovies: _popularMovies,
                upcomingMovies: _upcomingMovies,
                currentMovies: _currentmovies,
                callback: callback,
                selectedFilterIdx: _selectedFilterIdx,
              ),
              _isLoading
                  ? LayoutBuilder(builder: (context, contraints) {
                      double gridHeight = (contraints.maxWidth / 5) * 1.25 * 3;
                      return SizedBox(
                          height: gridHeight,
                          child: const PopularMovieSkeleton());
                    })
                  : LayoutBuilder(builder: (context, contraints) {
                      double gridHeight = (contraints.maxWidth / 5) *
                          1.25 *
                          (_popularMovies.length / 5);
                      return SizedBox(
                          height: gridHeight,
                          child:
                              PopularMoviesView(popularMovies: _currentmovies));
                    }),
                    Footer()
            ]),
          ),
        ));
  }
}
