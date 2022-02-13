import 'package:flutter/material.dart';
import 'package:movie_moa/component/text_field_container.dart';
import 'package:movie_moa/constants/colors.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final Icon icon;
  final ValueChanged<String> onChanged;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        enabled: false,
        onChanged: onChanged,
        cursorColor: Colors.black.withOpacity(0.8),
        decoration: InputDecoration(
            icon: icon, hintText: hintText),
      ),
    );
  }
}
