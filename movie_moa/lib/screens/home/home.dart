import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:movie_moa/screens/MovieList/current_movie.dart';

>>>>>>> fc55121a54fc54402a53f0afc2c5211ad9af99d9
import 'package:movie_moa/screens/etcService/my_page.dart';
import 'package:movie_moa/screens/home/widgets/home_service.dart';

<<<<<<< HEAD
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<Widget> screenList = [Text('Home'), Text('MyPage')];
  CupertinoTabController controller = CupertinoTabController();
=======
class HomePage extends StatelessWidget {
  int screenIndex = 0;
  List<Widget> screenList = [Text('Home'), Text('MyPage')];
>>>>>>> fc55121a54fc54402a53f0afc2c5211ad9af99d9
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
<<<<<<< HEAD
                return CupertinoPageScaffold(child: MyPage()); /*마이페이지 창으로 이동*/
=======
                return CupertinoPageScaffold(
                    child: Movielist()); /*홈페이지 서비스 기본 페이지 코드*/
>>>>>>> fc55121a54fc54402a53f0afc2c5211ad9af99d9
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
