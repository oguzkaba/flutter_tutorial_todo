import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tutorial_todo/api/api_controller.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  ApiController ac = Get.put(ApiController());
  final isOnline = true.obs;
  final formKey = GlobalKey<FormState>().obs;
  final uname = ''.obs;
  final pass = ''.obs;
  final pass2 = ''.obs;
  final email = ''.obs;

  Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
// linkText.value = value;
//     isOnline.value = await hasInternetConnection();
//     //validURL.value = isURL(linkText.value, requireTld: true);

//     if (validURL.value && isOnline.value) {
//       //await ac.getData(value).whenComplete(() => lc.addData(ac.link.value));
//       hintColor.value = Colors.grey;
//     }

  String? validateInput(String? value) {
    if (value!.isEmpty) {
      return 'Please fill username';
    } else if (value.length < 6) {
      return 'Username must be 6 length character';
    } else {
      print('nullbura');
      return null;
    }
  }
}
