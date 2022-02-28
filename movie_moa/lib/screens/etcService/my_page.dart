import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:movie_moa/constants/colors.dart';
import 'package:movie_moa/screens/etcService/login_page/login_page.dart';
>>>>>>> fc55121a54fc54402a53f0afc2c5211ad9af99d9
import 'package:movie_moa/screens/etcService/widgets/profile_bar.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(
        top: 60,
        bottom: 15,
        left: 25,
        right: 25,
      ),
      child: profileBar(
        page: LoginScreen(),
        txt: "로그인이 필요한 서비스 입니다.",
      ),
    ));
  }
}

/*Widget _buildIcon(IconData icon) {
  return Container(
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          color: kGridColor,
        )),
    child: Icon(icon),
  );
}*/
