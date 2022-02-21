import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class tmp extends StatefulWidget {
  const tmp({Key? key}) : super(key: key);

  @override
  _tmpState createState() => _tmpState();
}

class _tmpState extends State<tmp> {
  final List<String> list = <String>['test1', 'test2'];
  final List<bool> val = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return ListView.builder(
      padding: EdgeInsets.all(height * 0.03),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return customSwitch(list[index], val[index]);
      },
    );
  }
}

void onChangeFunction(bool val, bool newValue) {
  val = newValue;
}

Widget customSwitch(String text, bool val) {
  return Padding(
      padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
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
                onChangeFunction(val, newValue);
              })
        ],
      ));
}
