import 'package:flutter/material.dart';
import 'package:flutter_tutorial_todo/model/globals_model.dart';
import 'package:flutter_tutorial_todo/view/widget/boxcontainer_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: GlobalValues.baby_powder,
        bottomSheet: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: Text('Todo.',
                    style: TextStyle(
                        color: GlobalValues.middle_blue,
                        fontSize: 75,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: BoxContainer(route: 'signup'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
