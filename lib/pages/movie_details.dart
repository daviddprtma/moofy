import 'package:flutter/material.dart';
import 'package:moofy/models/movie.dart';
import 'package:moofy/services/model_service.dart';
import 'package:moofy/widgets/drawer.dart';
import 'package:moofy/widgets/navbar.dart';

class MovieDetailsPage extends StatefulWidget {
  final String movieId;
  const MovieDetailsPage({super.key, required this.movieId});

  @override
  State<StatefulWidget> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  List<Movie> _similarMovies = [];
  late Movie movieDetail;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async{
    movieDetail = await ModelService().fetchMovieById(widget.movieId);
    _similarMovies = await ModelService().fetchSimilarMovie(widget.movieId);
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomNavbar(),
      drawer: CustomDrawer(),
      body: Center(
        child: Text("Movie Details"),
      ),
    );
  }
}
