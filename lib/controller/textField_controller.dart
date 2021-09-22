import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial_todo/api/api_controller.dart';
import 'package:get/get.dart';

class TextFieldController extends GetxController {
  ApiController ac = Get.put(ApiController());
  final isOnline = true.obs;
  final validURL = true.obs;
  final linkText = ''.obs;
  final hintText = 'Shorten a link here ...'.obs;
  final formKey = GlobalKey<FormState>().obs;
  final hintColor = Colors.grey.obs;

  void borderColored(value) => hintColor.value = Colors.grey;

  Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  Future<void> validateLinkSubmit(String value) async {
    if (linkText.isEmpty) {
      hintText.value = 'Please add a link here';
      hintColor.value = Colors.red;
    }

    linkText.value = value;
    isOnline.value = await hasInternetConnection();
    //validURL.value = isURL(linkText.value, requireTld: true);

    if (validURL.value && isOnline.value) {
      //await ac.getData(value).whenComplete(() => lc.addData(ac.link.value));
      hintColor.value = Colors.grey;
    }
  }
}
