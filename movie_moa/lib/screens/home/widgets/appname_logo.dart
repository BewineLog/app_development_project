import 'package:flutter/material.dart';

class logo_name extends StatelessWidget {
  //const logo_name({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 200),
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
              margin: EdgeInsets.only(top: 40),
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
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Image.asset("assets/images/water_circle.png",
                    width: 230, height: 230, fit: BoxFit.fill),
              ),
            ),
          ],
        ), //block_2 App_name
      ],
    );
  }
}
