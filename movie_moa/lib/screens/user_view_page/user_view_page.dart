import 'package:flutter/material.dart';
import 'package:movie_moa/constants/colors.dart';
import 'package:movie_moa/screens/home/widgets/grey_grid.dart';
import 'package:movie_moa/screens/user_view_page/widgets/find_more_info.dart';
import 'package:movie_moa/screens/user_view_page/widgets/options.dart';
import 'package:movie_moa/screens/user_view_page/widgets/output_list_view.dart';
import 'package:movie_moa/screens/user_view_page/widgets/upper_title.dart';
import 'package:movie_moa/widgets/app_bar.dart';

class User_View_Page extends StatelessWidget {
  List<bool> selection;
  String time1;
  String time2;
  int cnt;
  User_View_Page({Key? key, 
  required this.selection, 
  required this.time1, 
  required this.time2,
  required this.cnt
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [Upper_Title(), CustomAppBar()],
          ), //page_2 title
          grey_grid(),
          Text('<설정된 조건>'),
          Text(selection.toString()),
          Text(time1+'   '+time2),
          Text(cnt.toString()),
          // Find_more_info(), //더 많은 영화관 보기 구체적인 구현에 따라 달라질 예정
          // grey_grid(),

          // Option_View(),
          // /*기존 3페이지 옵션 view -> 누르면 2페이지 이동, 추가 옵션 설정으로 변경 예정*/
          // grey_grid(),
          // /*
          // -나중에 영화 관련 데이터 정리 끝나면, DB든 txt든 읽어와서 값을 넣는 걸로 변경
          // -일단 format을 위해서 Text()로 구현
          // */
          Output_List_View(),
        ],
      ),
    );
  }
}
