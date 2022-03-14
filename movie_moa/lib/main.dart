import 'package:flutter/material.dart';
import 'package:movie_moa/screens/MovieList/data.dart';
import 'package:movie_moa/screens/home/home.dart';

void main() async {
  FutureBuilder.debugRethrowError = true;
  WidgetsFlutterBinding.ensureInitialized();
  fetchData(); //Ranking Data Fetch 후 DB 저장
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie_Moa',
      home: HomePage(),
    );
  }
}
