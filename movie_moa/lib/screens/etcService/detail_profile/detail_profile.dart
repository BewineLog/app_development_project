import 'package:flutter/material.dart';
import 'package:movie_moa/widgets/app_bar.dart';

class detailProfile extends StatelessWidget {
  const detailProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomAppBar(),
          Container(
            padding: EdgeInsets.only(top: 100),
            child: Text('Detail Profile'),
          ),
        ],
      ),
    );
  }
}
