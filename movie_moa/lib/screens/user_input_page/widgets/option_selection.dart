import 'package:flutter/material.dart';
import 'package:movie_moa/component/rounded_input_field.dart';

class Option_Selection extends StatelessWidget {
  // const Option_Selection({Key? key}) : super(key: key);

  final String hintText;
  final Icon icon;
  final ValueChanged<String> onChanged;

  const Option_Selection({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      //padding:,
      // decoration: BoxDecoration(
      //     color: kBackgroundColor,
      //     border: Border.all(
      //       color: Colors.grey,
      //     )),
      child: RoundedInputField(
        hintText: hintText,
        icon: icon,
        onChanged: onChanged,
      ),
    );
  }
}
