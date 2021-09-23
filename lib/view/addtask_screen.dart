import 'package:flutter/material.dart';
import 'package:flutter_tutorial_todo/model/globals_model.dart';
import 'package:get/get.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text('Todo.',
                style: TextStyle(
                    color: GlobalValues.middle_blue,
                    fontSize: 75,
                    fontWeight: FontWeight.bold)),
            Divider(color: GlobalValues.middle_blue, height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Add Task',
                    style: TextStyle(
                        color: GlobalValues.marigold,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
