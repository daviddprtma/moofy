import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moofy/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Homepage(),
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
