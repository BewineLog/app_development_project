import 'package:flutter/material.dart';
import 'package:movie_moa/component/already_have_an_account.dart';
import 'package:movie_moa/component/login_check.dart';
import 'package:movie_moa/component/rounded_button.dart';
import 'package:movie_moa/component/rounded_input_field.dart';
import 'package:movie_moa/component/rounded_password_field.dart';
import 'package:movie_moa/screens/etcService/login_page/background.dart';
import 'package:movie_moa/screens/etcService/login_success_page/login_success_page.dart';

import 'package:movie_moa/screens/etcService/sign_up_page/sign_up_page.dart';

class Body extends StatelessWidget {
  String id = 'abc';
  String passwd = '1234';
  late final bool id_check;
  late final bool passwd_check;

  Body({
    Key? key,
    required this.id_check,
    required this.passwd_check,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Icon(Icons.movie_creation_outlined),
                /*로고 들어갈 위치*/
                Text(
                  "LOGIN",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedInputField(
              icon: Icon(Icons.input_outlined),
              hintText: "Your Email",
              onChanged: (value) {
                if (value == id) {
                  id_check = true;
                }
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                if (value == passwd) {
                  passwd_check = true;
                }
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                if (id_check == true && passwd_check == true) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => loginSuccessScreen()));
                }
              },
            ),
            SizedBox(
              height: size.height * 0.03,
            ),

            /* 회원 가입 페이지 필요. */

            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}
