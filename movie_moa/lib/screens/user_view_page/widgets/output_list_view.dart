import 'package:flutter/material.dart';
import 'package:movie_moa/screens/home/widgets/grey_grid.dart';

class Output_List_View extends StatelessWidget {
  const Output_List_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      padding: EdgeInsets.only(top: 0),
      child: ListView(
        padding: EdgeInsets.only(top: 0),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          ListTile(
            title: Text('<movie_list>'),
          ),
          ListTile(
              title: Text(
                  '특송\nCGV 동대문/ 1관 10층/ 2050~2248/ 114\n서울시 중구 을지로6가 17-2 현대시티아울렛 10층/ 1544-1122')),
          grey_grid(),
          ListTile(
              title: Text(
                  '특송\nCGV 동대문/ 1관 10층/ 2050~2248/ 114\n서울시 중구 을지로6가 17-2 현대시티아울렛 10층/ 1544-1122')),
          grey_grid(),
          ListTile(
              title: Text(
                  '특송\nCGV 동대문/ 1관 10층/ 2050~2248/ 114\n서울시 중구 을지로6가 17-2 현대시티아울렛 10층/ 1544-1122')),
          grey_grid(),
          ListTile(
              title: Text(
                  '특송\nCGV 동대문/ 1관 10층/ 2050~2248/ 114\n서울시 중구 을지로6가 17-2 현대시티아울렛 10층/ 1544-1122')),
          grey_grid(),
          ListTile(
              title: Text(
                  '특송\nCGV 동대문/ 1관 10층/ 2050~2248/ 114\n서울시 중구 을지로6가 17-2 현대시티아울렛 10층/ 1544-1122')),
          grey_grid(),
          ListTile(
              title: Text(
                  '특송\nCGV 동대문/ 1관 10층/ 2050~2248/ 114\n서울시 중구 을지로6가 17-2 현대시티아울렛 10층/ 1544-1122')),
          grey_grid(),
          ListTile(
              title: Text(
                  '특송\nCGV 동대문/ 1관 10층/ 2050~2248/ 114\n서울시 중구 을지로6가 17-2 현대시티아울렛 10층/ 1544-1122')),
          grey_grid(),
          ListTile(
              title: Text(
                  '특송\nCGV 동대문/ 1관 10층/ 2050~2248/ 114\n서울시 중구 을지로6가 17-2 현대시티아울렛 10층/ 1544-1122')),
          grey_grid(),
        ],
      ),
    );
  }
}
