/*import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_moa/constants/colors.dart';
import 'package:movie_moa/screens/home/widgets/grey_grid.dart';
import 'package:movie_moa/screens/user_view_page/widgets/upper_title.dart';
import 'package:movie_moa/widgets/app_bar.dart';


class movieList extends StatefulWidget {
  const movieList({Key? key}) : super(key: key);

  @override
  State<movieList> createState() => _movieListState();
}

class _movieListState extends State<movieList> {
  //movieList({Key? key}) : super(key: key);
  late Future<data> data;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Stack(
            alignment: Alignment.center,
            children: [Upper_Title(), CustomAppBar()],
          ),
          grey_grid()
        ]));
  }
}
*/
// 영화정보 불러온 뒤 완성