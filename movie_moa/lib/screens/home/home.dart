import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_moa/screens/MovieList/movieList.dart';

//import 'package:movie_moa/screens/MovieList/current_movie.dart';

import 'package:movie_moa/screens/loginService/my_page.dart';
import 'package:movie_moa/screens/home/widgets/home_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<Widget> screenList = [Text('Home'), Text('MyPage')];
  CupertinoTabController controller = CupertinoTabController();

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_numbered),
            label: 'Ranking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Mypage',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        Widget page;

        switch (index) {
          case 0:
            page = CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                    child: HomePageUi()); /*홈페이지 서비스 기본 페이지 코드*/
              },
            );
            break;
          case 1:
            page = CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                    child: movieList()); /*홈페이지 서비스 기본 페이지 코드*/
              },
            );
            break;
          case 2:
            page = CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(child: MyPage()); /*마이페이지 창으로 이동*/
              },
            );
            break;

          default:
            return const MyPage();
        }
        return page;
      },
    );
  }
}
