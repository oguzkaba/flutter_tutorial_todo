import 'package:flutter_tutorial_todo/api/todo_model.dart';
import 'package:get/get.dart';
import 'package:flutter_tutorial_todo/api/services.dart';
import 'package:flutter_tutorial_todo/api/users_model.dart';

class ApiController extends GetxController {
  final isLoading = true.obs;
  List<UsersModel> listUsers = <UsersModel>[].obs;
  List<TodosModel> listTodos = <TodosModel>[].obs;

  @override
  void onInit() {
    getUsersData();
    getTodosData(10, 0);
    super.onInit();
  }

  Future<void> getUsersData() async {
    listUsers.clear();
    try {
      listUsers = await RemoteServices.getUsers();
    } finally {}
  }

  Future<void> getTodosData(int? limit, int? offset) async {
    try {
      listTodos += await RemoteServices.getTodos(limit!, offset!);
      isLoading(true);
    } finally {
      isLoading(false);
    }
  }
}
