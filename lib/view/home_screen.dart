import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial_todo/api/api_controller.dart';
import 'package:flutter_tutorial_todo/controller/companent_controller.dart';
import 'package:flutter_tutorial_todo/model/globals_model.dart';
import 'package:flutter_tutorial_todo/view/addtask_screen.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiController apic = Get.put(ApiController());
    CompanentController cc = Get.put(CompanentController());

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: GlobalValues.marigold,
            onPressed: () => Get.to(() => AddTaskScreen()),
            child: Icon(Icons.add, size: 40)),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
                child: Text('Hey ${cc.nickname.value},',
                    style: TextStyle(
                        color: GlobalValues.marigold,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Obx(() => apic.isLoading.value
                ? mainEmptyScreen()
                : mainFillScreen(apic)),
          ],
        ),
      ),
    );
  }

  Widget mainFillScreen(ApiController ac) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: ac.listTodos.length,
            itemBuilder: (context, index) {
              return Card(
                  color: ac.listTodos[index].completed == 0
                      ? Colors.white
                      : GlobalValues.salmon_pink,
                  child: ListTile(
                    leading: Checkbox(
                        activeColor: GlobalValues.baby_powder,
                        checkColor: GlobalValues.marigold,
                        onChanged: (bool? value) =>
                            null, // Update Eklenecek....
                        value:
                            ac.listTodos[index].completed == 0 ? false : true),
                    selectedTileColor: GlobalValues.marigold,
                    subtitle: Text(ac.listTodos[index].content.toString(),
                        style: TextStyle(
                            decoration: ac.listTodos[index].completed == 0
                                ? TextDecoration.none
                                : TextDecoration.lineThrough)),
                    title: Text(ac.listTodos[index].title.toString(),
                        style: TextStyle(
                            color: ac.listTodos[index].completed == 0
                                ? Colors.lightBlue[900]
                                : Colors.white,
                            fontWeight: FontWeight.bold,
                            decoration: ac.listTodos[index].completed == 0
                                ? TextDecoration.none
                                : TextDecoration.lineThrough)),
                    trailing:
                        IconButton(onPressed: null, icon: Icon(Icons.alarm)),
                  ));
            }),
      ),
    );
  }

  Widget mainEmptyScreen() {
    return Container(
        child: Center(
            child: CircularProgressIndicator(color: GlobalValues.middle_blue)));
  }
}
