import 'package:flutter/material.dart';
import 'package:flutter_tutorial_todo/api/api_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApiController apic = Get.put(ApiController());

    return Scaffold(
      appBar: AppBar(title: Text('TODO.'), centerTitle: true),
      body: Obx(() =>
          apic.isLoading.value ? mainEmptyScreen() : mainFillScreen(apic)),
    );
  }

  Widget mainFillScreen(ApiController apiC) {
    return ListView.builder(
        itemCount: apiC.list.length,
        itemBuilder: (context, index) {
          return Card(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(apiC.list[index].name.toString())));
        });
  }

  Widget mainEmptyScreen() {
    return Container(child: Center(child: Text('Data Yok')));
  }
}
