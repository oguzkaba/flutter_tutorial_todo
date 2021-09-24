import 'package:get/get.dart';

class CompanentController extends GetxController {
  final nickname = ''.obs;
  final title = ''.obs;
  final content = ''.obs;

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
