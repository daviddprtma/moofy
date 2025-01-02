import 'package:flutter/material.dart';
import 'package:moofy/models/movie.dart';
import 'package:moofy/services/model_service.dart';
import 'package:moofy/widgets/drawer.dart';
import 'package:moofy/widgets/footer.dart';
import 'package:moofy/widgets/home_widgets/popular_movies_view.dart';
import 'package:moofy/widgets/navbar.dart';
import 'package:moofy/widgets/skeletons/popular_movie_skeleton.dart';

class MovieDetailsPage extends StatefulWidget {
  final String movieId;
  const MovieDetailsPage({super.key, required this.movieId});

  @override
  State<StatefulWidget> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  List<Movie> _similarMovies = [];
  late Movie movieDetail;
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    movieDetail = await ModelService().fetchMovieById(widget.movieId);
    _similarMovies = await ModelService().fetchSimilarMovie(widget.movieId);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void didUpdateWidget(covariant MovieDetailsPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.movieId != widget.movieId) {
      setState(() {
        _isLoading = true;
      });
      getData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomNavbar(),
      drawer: CustomDrawer(),
      body: _isLoading
          ? const CircularProgressIndicator()
          : (movieDetail != null)
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                          height: 2000,
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 400,
                                    child: Stack(
                                      children: [
                                        Image.network(
                                          'https://image.tmdb.org/t/p/original${movieDetail.backdropPath}',
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                  colors: [
                                                Colors.black,
                                                Colors.transparent
                                              ])),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Positioned(
                                  top: 300,
                                  left: 20,
                                  right: 20,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.network(
                                              'https://image.tmdb.org/t/p/w500${movieDetail.posterPath}',
                                              width: 150,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Expanded(
                                              child: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  movieDetail.originalTitle,
                                                  style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                Text(
                                                  movieDetail.overview,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                ),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                Text(
                                                  movieDetail.releaseDate,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                ),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                Text(
                                                  "Popularity: ${movieDetail.popularity.toString()}",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white),
                                                ),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 8),
                                                  child: Text(
                                                    'Original Language: ${movieDetail.originalLanguage}',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        color: Colors.grey),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ))
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 25),
                                        child: Text(
                                          "Similar Movies",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20),
                                          child: LayoutBuilder(
                                              builder: (context, contraints) {
                                            return _isLoading
                                                ? const PopularMovieSkeleton()
                                                : PopularMoviesView(
                                                    popularMovies:
                                                        _similarMovies);
                                          }))
                                    ],
                                  ))
                            ],
                          )),
                      Footer()
                    ],
                  ),
                )
              : Center(
                  child: Text("Failed to load Data"),
                ),
    );
  }
}
