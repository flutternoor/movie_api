import 'package:flutter/material.dart';
import 'package:movie/screens/movie_search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MovieSearchScreen(),
    );
  }
}


