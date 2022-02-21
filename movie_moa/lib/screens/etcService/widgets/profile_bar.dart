import 'package:flutter/material.dart';
import 'package:movie_moa/component/variable.dart';
import 'package:movie_moa/constants/colors.dart';
import 'package:movie_moa/screens/etcService/login_page/login_page.dart';
import 'package:movie_moa/screens/etcService/login_success_page/login_success_page.dart';

class profileBar extends StatelessWidget {
  dynamic page;
  String txt;

  profileBar({Key? key, required this.page, required this.txt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildIcon(Icons.person),
        Text(
          txt,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
            onTap: () => (id_check && passwd_check)
                ? Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => loginSuccessScreen()))
                : Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen())),
            child: Icon(Icons
                .keyboard_arrow_right_outlined)), /* 마이페이지 로그인 전 > 버튼 누르면 로그인 창으로 이동 */
      ],
    );
  }
}

Widget _buildIcon(IconData icon) {
  return Container(
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          color: kGridColor,
        )),
    child: Icon(icon),
  );
}
