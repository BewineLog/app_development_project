import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_moa/component/variable.dart';

class MultiSwitch extends StatefulWidget {
  const MultiSwitch({Key? key, required this.txt}) : super(key: key);
  final String txt;
  @override
  _MultiSwitchState createState() => _MultiSwitchState();
}

class _MultiSwitchState extends State<MultiSwitch> {
  //bool val = false;

  onChangeFunction(bool newValue) {
    setState(() {
      val = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customSwitch(widget.txt, val, onChangeFunction),
          Row(children: [Container(child: Text(val.toString()))]),
        ],
      ),
    );
  }
}

Widget customSwitch(String text, bool val, Function onChangeMethod) {
  return Padding(
      padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          //Spacer(),
          CupertinoSwitch(
              trackColor: Colors.grey,
              activeColor: Colors.blue,
              value: val,
              onChanged: (newValue) {
                onChangeMethod(newValue);
              })
        ],
      ));
}
