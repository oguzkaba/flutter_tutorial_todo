import 'package:flutter/material.dart';
import 'package:flutter_tutorial_todo/model/globals_model.dart';

class BoxContainer extends StatelessWidget {
  final Widget? child;

  BoxContainer({
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: GlobalValues.marigold.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 15,
                offset: Offset(0, -3))
          ],
          color: GlobalValues.marigold,
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: child),
    );
  }
}
