import 'package:flutter/material.dart';
import 'package:movie_moa/component/login_check.dart';
import 'package:movie_moa/screens/etcService/login_page/body.dart';
import 'package:movie_moa/screens/etcService/login_success_page/login_success_page.dart';
import 'package:movie_moa/widgets/app_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        CustomAppBar(),
        Column(
          children: [Body()],
        )
      ],
    ));
  }
}
/*
class LoginScreen extends StatelessWidget {
  late LoginValidation loginValidation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        CustomAppBar(),
        Column(
          children: [Body(loginValidation.id_check, )],
        )
      ],
    ));
  }
}*/
