import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_moa/DB/movieRankingInfo.dart';
import 'package:movie_moa/constants/colors.dart';

import 'data.dart';

class movieList extends StatefulWidget {
  const movieList({Key? key}) : super(key: key);

  @override
  State<movieList> createState() => _movieListState();
}

class _movieListState extends State<movieList> {
  //movieList({Key? key}) : super(key: key);
  late Future<List<Data>> rankingData;
  @override
  void initState() {
    super.initState();
    rankingData = DBHelper_ri().data(); // DB로만 Ranking Data 호출
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('MovieRanking')),
        backgroundColor: kBackgroundColor,
        body: Padding(
            padding: const EdgeInsets.all(5),
            child: FutureBuilder<List<Data>>(
              future: rankingData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, int index) => Card(
                      child: ListTile(
                          title: Text(
                        snapshot.data![index].rank +
                            "/" +
                            snapshot.data![index].movieNm +
                            "/" +
                            snapshot.data![index].audiCnt,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )),
                    ),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            )));
  }
}
