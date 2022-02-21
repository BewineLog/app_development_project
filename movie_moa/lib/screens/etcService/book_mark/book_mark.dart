import 'package:flutter/material.dart';
import 'package:movie_moa/component/variable.dart';
import 'package:movie_moa/screens/etcService/login_success_page/login_success_page.dart';
//
// This is tmp Code.
//

class BookMark extends StatefulWidget {
  const BookMark({Key? key}) : super(key: key);

  @override
  _BookMarkState createState() => _BookMarkState();
}

class _BookMarkState extends State<BookMark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text('즐겨찾기 추가 페이지'),
        Column(
          children: [
            FloatingActionButton(
                focusColor: Colors.amberAccent,
                onPressed: () {
                  list.add('hahaha');
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => loginSuccessScreen()));
                })
          ],
        )
      ],
    ));
  }
}
