import 'package:flutter/material.dart';

class Upper_TeamName extends StatelessWidget {
  const Upper_TeamName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    final width = data.size.width;
    final height = data.size.height;
    return Container(
      margin: EdgeInsets.only(top: height * 0.06),
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(left: width * 0.8),
        child: Text(
          'TeamName!', // 어떻게 처리하지?
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
