import 'package:flutter/material.dart';
import 'package:moofy/models/movie.dart';

class NowPlayingList extends StatelessWidget {
  final List<Movie> nowPlayingMovie;

  const NowPlayingList({super.key, required this.nowPlayingMovie});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: nowPlayingMovie.length,
        itemBuilder: (context, index) {
          final movie = nowPlayingMovie[index];
          return ListTile(
            onTap: () {},
            leading: Image.network(
              "https://image.tmdb.org/t/p/w200/${movie.posterPath}",
              width: 80,
              height: 120,
              fit: BoxFit.cover,
            ),
            title: Text(
              movie.title,
              style: const TextStyle(color: Color(0xFFE2B626)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              movie.overview,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          );
        });
  }
}
