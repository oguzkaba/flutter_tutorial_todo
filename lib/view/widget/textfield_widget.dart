import 'package:flutter/material.dart';
import 'package:flutter_tutorial_todo/model/globals_model.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final bool? obsecured;
  final String? hintText;
  final IconData? icon;
  const TextFieldWidget({
    @required this.obsecured,
    @required this.controller,
    @required this.hintText,
    this.icon,
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: obsecured ?? false,
        controller: controller,
        cursorColor: GlobalValues.baby_powder,
        maxLines: 1,
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 2)),
            enabledBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: GlobalValues.baby_powder)),
            prefixIcon: Icon(icon, color: GlobalValues.baby_powder),
            hintText: hintText,
            hintStyle: TextStyle(
              color: GlobalValues.baby_powder,
            )));
  }
}
