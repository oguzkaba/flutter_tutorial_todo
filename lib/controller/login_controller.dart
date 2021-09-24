import 'dart:io';

import 'package:get/get.dart';

class LoginController extends GetxController {
  final isOnline = true.obs;
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

  String? validateInput(String? value) {
    if (value!.isEmpty) {
      return 'Please fill area';
    } else if (value.length < 6) {
      return 'Username must be 6 length character';
    } else {
      print('nullbura');
      return null;
    }
  }
}
