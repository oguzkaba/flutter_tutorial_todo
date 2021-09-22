import 'package:get/get.dart';
import 'package:flutter_tutorial_todo/api/services.dart';
import 'package:flutter_tutorial_todo/api/users_model.dart';

class ApiController extends GetxController {
  final isLoading = false.obs;
  List<UsersModel> list = <UsersModel>[].obs;

  @override
  void onInit() {
    // tcontroller = TextEditingController();
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    list.clear();
    try {
      list = await RemoteServices.getUsers();
      isLoading(true);
    } finally {
      isLoading(false);
    }
  }
}
