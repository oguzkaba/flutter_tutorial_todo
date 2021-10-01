import 'package:flutter/material.dart';
import 'package:flutter_tutorial_todo/api/api_controller.dart';
import 'package:flutter_tutorial_todo/api/services.dart';
import 'package:flutter_tutorial_todo/controller/companent_controller.dart';
import 'package:flutter_tutorial_todo/model/globals_model.dart';
import 'package:flutter_tutorial_todo/view/home_screen.dart';
import 'package:get/get.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApiController apic = Get.put(ApiController());
    final CompanentController cc = Get.put(CompanentController());
    GlobalKey<FormState> formKeyAdd = GlobalKey<FormState>();

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
              padding: const EdgeInsets.all(15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Add Task',
                    style: TextStyle(
                        color: GlobalValues.marigold,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 30),
              child: Form(
                key: formKeyAdd,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  TextFormField(
                      onChanged: (value) => cc.title.value = value,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.lightBlue[900],
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          hintText: 'Title...',
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: GlobalValues.middle_blue, width: 2)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: GlobalValues.middle_blue)),
                          hintStyle: TextStyle(
                            color: GlobalValues.middle_blue,
                          ))),
                  SizedBox(height: 10),
                  TextFormField(
                      maxLines: 5,
                      onChanged: (value) => cc.content.value = value,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.lightBlue[900],
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          hintText: 'Contetent...',
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: GlobalValues.middle_blue, width: 2)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: GlobalValues.middle_blue)),
                          hintStyle: TextStyle(
                            color: GlobalValues.middle_blue,
                          ))),
                  SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () async {
                        if (formKeyAdd.currentState!.validate()) {
                          if (await RemoteServices.addTodo(
                              cc.title.value, cc.content.value)) {
                            await apic.getTodosData(10, 0);
                            Get.to(() => HomePage());
                          }
                        }
                      },
                      child: Text(
                        'Done',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: GlobalValues.baby_powder,
                            fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: GlobalValues.middle_blue,
                          fixedSize: Size(Get.width * .9, 45),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
