import 'package:flutter/material.dart';
import 'package:movie_moa/screens/etcService/login_page/login_page.dart';

import 'package:movie_moa/screens/etcService/login_success_page/login_success_page.dart';
import 'package:movie_moa/screens/home/home.dart';

import 'package:movie_moa/screens/etcService/my_page.dart';
import 'package:movie_moa/component/variable.dart';

class book_mark extends StatelessWidget {
  //const book_mark({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    final width = data.size.width;
    final height = data.size.height;
    return Column(
      children: [
        RawMaterialButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star_border_outlined,
                color: Color(0xFFFDBF30),
                size: height * 0.03,
              ),
              Container(
                alignment: Alignment.center,
                //decoration
                child: Text(
                  '개인프로필',
                  style: TextStyle(
                    fontSize: height * 0.02,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),

          onPressed: () => {
            if (id_check && passwd_check)
              {
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => loginSuccessScreen())),
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => loginSuccessScreen())),
              }
            else
              {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen()))
              }
          },
          //onPressed: () => Navigator.of(context)
          //  .push(MaterialPageRoute(builder: (context) => LoginScreen())),
        ),
      ],
    );
  }
}
