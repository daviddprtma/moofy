import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moofy/pages/home.dart';
import 'package:moofy/pages/movie_details.dart';
import 'package:moofy/pages/movies.dart';
import 'package:moofy/pages/search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Homepage(),
    ),
    GoRoute(
      path: '/movies',
      builder: (context, state) => const MoviesPage(),
    ),
    GoRoute(
      path: '/search/:query',
      builder: (context, state) {
        final query = state.pathParameters['query']!;
        return SearchPage(query: query);
      },
    ),
    GoRoute(
      path: '/movie/:movieId',
      builder: (context, state) {
        final movieId = state.pathParameters['movieId']!;
        return MovieDetailsPage(movieId: movieId);
      },
    )
  ]);

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Moofy',
      theme: ThemeData.dark(),
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
