import 'package:flutter/material.dart';
import 'package:flutter_tutorial_todo/controller/companent_controller.dart';
import 'package:flutter_tutorial_todo/model/globals_model.dart';
import 'package:flutter_tutorial_todo/view/home_screen.dart';
import 'package:get/get.dart';

class CreateNick extends StatelessWidget {
  const CreateNick({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CompanentController cc = Get.put(CompanentController());
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('Todo.',
                      style: TextStyle(
                          color: GlobalValues.middle_blue,
                          fontSize: 75,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                      width: 200,
                      child:
                          Divider(color: GlobalValues.middle_blue, height: 5)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: Text('Create Your Cool Nickname',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: GlobalValues.middle_blue,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48.0),
                    child: TextFormField(
                        onChanged: (value) => cc.nickname.value = value,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.lightBlue[900],
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                    color: GlobalValues.middle_blue, width: 2)),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                    color: GlobalValues.middle_blue)),
                            hintStyle: TextStyle(
                              color: GlobalValues.middle_blue,
                            ))),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Obx(() => cc.nickname.value.length < 4
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: Text('Skip',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: GlobalValues.middle_blue,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold)),
                          )
                        : Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                                onPressed: () => Get.off(() => HomePage()),
                                icon: Icon(Icons.arrow_forward_ios,
                                    size: 30, color: GlobalValues.middle_blue)),
                          ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
