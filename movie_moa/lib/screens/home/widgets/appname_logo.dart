import 'package:flutter/material.dart';

class logo_name extends StatelessWidget {
  //const logo_name({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    final width = data.size.width;
    final height = data.size.height;
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, width * 0.1),
          child: Text(
            'AppName + TeamLogo',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ), //block_2 left top text

        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: width * 0.1),
              alignment: Alignment.center,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Moive_Moa",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(0, width * 0.1, 0, 0),
                child: Image.asset("assets/images/water_circle.png",
                    width: width * 0.5, height: height * 0.3, fit: BoxFit.fill),
              ),
            ),
          ],
        ), //block_2 App_name
      ],
    );
  }
}
