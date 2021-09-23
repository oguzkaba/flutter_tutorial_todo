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
    getTodosData();
    super.onInit();
  }

  Future<void> getUsersData() async {
    listUsers.clear();
    try {
      listUsers = await RemoteServices.getUsers();
    } finally {}
  }

  Future<void> getTodosData() async {
    listTodos.clear();
    try {
      listTodos = await RemoteServices.getTodos();
      isLoading(true);
    } finally {
      isLoading(false);
    }
  }
}
