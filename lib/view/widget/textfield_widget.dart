import 'package:flutter/material.dart';
import 'package:flutter_tutorial_todo/model/globals_model.dart';

class TextFieldWidget extends StatelessWidget {
  final String? Function(String?) validator;
  final Function(String)? onchange;
  //final TextEditingController? controller;
  final bool? obsecured;
  final String? hintText;
  final IconData? icon;
  final IconData? icon2;
  const TextFieldWidget({
    required this.onchange,
    required this.validator,
    required this.obsecured,
    this.icon2,
    required this.hintText,
    this.icon,
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onChanged: onchange,
        validator: validator,
        obscureText: obsecured ?? false,
        //controller: controller,
        cursorColor: GlobalValues.baby_powder,
        maxLines: 1,
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 2)),
            enabledBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: GlobalValues.baby_powder)),
            prefixIcon: Icon(icon, color: GlobalValues.baby_powder),
            suffixIcon: Icon(icon2, color: GlobalValues.baby_powder),
            hintText: hintText,
            hintStyle: TextStyle(
              color: GlobalValues.baby_powder,
            )));
  }
}
