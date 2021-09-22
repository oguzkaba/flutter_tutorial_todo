import 'package:flutter/material.dart';
import 'package:flutter_tutorial_todo/api/api_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiController apiC = Get.put(ApiController());

    return Scaffold(
      appBar: AppBar(title: Text('TODO.'), centerTitle: true),
      body: Obx(() =>
          apiC.isLoading.value ? mainEmptyScreen() : mainFillScreen(apiC)),
    );
  }

  Widget mainFillScreen(ApiController apiC) {
    return ListView.builder(
        itemCount: apiC.list.length,
        itemBuilder: (context, index) {
          return Card(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text("Username: " + apiC.list[index].name.toString(),
                        style: TextStyle(fontSize: 20)),
                    leading: Text(
                        "Level: " + apiC.list[index].levelsId.toString(),
                        style: TextStyle(fontSize: 20)),
                    trailing: Text(
                        "Personnel No: " +
                            apiC.list[index].personnelId.toString(),
                        style: TextStyle(fontSize: 20)),
                  )));
        });
  }

  Widget mainEmptyScreen() {
    return Container(child: Center(child: Text('Data Yok')));
  }
}