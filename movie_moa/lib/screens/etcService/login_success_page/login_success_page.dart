import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:movie_moa/component/MultiSwitch.dart';
import 'package:movie_moa/component/variable.dart';
import 'package:movie_moa/screens/etcService/book_mark/book_mark.dart';
import 'package:movie_moa/screens/home/widgets/grey_grid.dart';

=======
import 'package:movie_moa/screens/search_screen/search_object_list.dart';
import 'package:movie_moa/tmp/on_off_button.dart';
>>>>>>> fc55121a54fc54402a53f0afc2c5211ad9af99d9
import 'package:movie_moa/screens/etcService/detail_profile/detail_profile.dart';
import 'package:movie_moa/screens/etcService/widgets/profile_bar.dart';

class loginSuccessScreen extends StatefulWidget {
  const loginSuccessScreen({
    Key? key,
  }) : super(key: key);

  @override
  _loginSuccessScreenState createState() {
    return _loginSuccessScreenState();
  }
  // @override
  // _loginSuccessScreenState createState() => _loginSuccessScreenState();
}

class _loginSuccessScreenState extends State<loginSuccessScreen> {
  //var refreshKey = GlobalKey<RefreshIndicatorState>();
  //final List<String> list = ['test1', 'test2'];
  ScrollController _controller = new ScrollController();
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final data = MediaQuery.of(context);
    final width = data.size.width;
    final height = data.size.height;
    //final List<String> list = ['test1', 'test2'];

    return Scaffold(
        body: Column(
      children: <Widget>[
        SizedBox(height: height * 0.05),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.all(height * 0.03),
              child:
                  profileBar(page: detailProfile(), txt: "로그인 후 ID/닉네임 들어갈 자리"),
            ),
          ],
        ),
        grey_grid(),
        Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              child: MaterialButton(
                child: Row(
                  children: [
                    Icon(
                      Icons.star_outlined,
                      color: Colors.yellow,
                    ),
                    Text("즐겨찾기 생성"),
                  ],
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => BookMark()));
                },
              ),
            ),
          ]),
          grey_grid(),
          /* 위 Row는 클릭시 즐겨찾기를 설정할 수 있는 페이지로 연결한 후, 즐겨찾기 값을 설정 ->  해당 값을 통해 즐겨찾기 서비스 제공*/
          Column(children: [
=======
    return Scaffold(
      body: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: 60,
            bottom: 15,
            left: 25,
            right: 25,
          ),
          child: profileBar(
            page: datailProfile(),
            txt: "로그인 후 ID/닉네임 들어갈 자리",
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('장르/영화관/시간')],
        ),
        Column(
          children: [
>>>>>>> fc55121a54fc54402a53f0afc2c5211ad9af99d9
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('option1'),
                onOffButton(),
              ],
            ),
<<<<<<< HEAD
          ]),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("여기서 부터 생성된 즐겨찾기 생성!")],
              ),
            ],
          ),
          Stack(children: [
            Container(
                height: height * 0.5,
                child: ListView(
                  /*  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  addAutomaticKeepAlives: true,
                  controller: _controller,
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(8),*/
                  children: <Widget>[
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return MultiSwitch(txt: list[index]);
                        })
                  ],
                )),
          ]),
        ])
      ],
    ));
=======
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 92,
                  width: 350,
                  child: Stack(
                    children: [
                      SearchFunction(
                        hintText: "선호하는 장소 검색",
                      ),
                    ],
                  ),
                ),
                /* Container(
                    height: 92,
                    width: 350,
                    child: SearchFunction(
                      hintText: "선호하는 장소 검색",
                    )),*/
              ],
            )
          ],
        )
      ]),
    );
>>>>>>> fc55121a54fc54402a53f0afc2c5211ad9af99d9
  }
}

/*SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    ListView.builder(
                        shrinkWrap: true,
                        //physics: NeverScrollableScrollPhysics(),
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return MultiSwitch(txt: list[index]);
                        })
                  ],
                )), */
/*Column(
        children: <Widget>[
          SizedBox(height: height * 0.05),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(height * 0.03),
                child: profileBar(
                    page: detailProfile(), txt: "로그인 후 ID/닉네임 들어갈 자리"),
              ),
            ],
          ),
          grey_grid(),
          Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                child: MaterialButton(
                  child: Row(
                    children: [
                      Icon(
                        Icons.star_outlined,
                        color: Colors.yellow,
                      ),
                      Text("즐겨찾기 생성"),
                    ],
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => BookMark()));
                  },
                ),
              ),
            ]),
            grey_grid(),
            /* 위 Row는 클릭시 즐겨찾기를 설정할 수 있는 페이지로 연결한 후, 즐겨찾기 값을 설정 ->  해당 값을 통해 즐겨찾기 서비스 제공*/
            Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("<즐겨찾기>")],
              ),
            ]),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("여기서 부터 생성된 즐겨찾기 생성!")],
                ),
              ],
            ),
            SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return MultiSwitch(txt: list[index]);
                        })
                  ],
                ))
          ]),
        ],
      ), */