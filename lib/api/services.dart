import 'dart:convert';

import 'package:flutter_tutorial_todo/api/todo_model.dart';
import 'package:flutter_tutorial_todo/api/users_model.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static const String BASE_URL =
      'http://10.0.2.2:8080/nc/appforapi_oDux/api/v1';
  static const String TOKEN_VALUE =
      'YR-CRSieH1i-Eawj8e6-pC6GbOvUEKE_P5XIrPfT'; //job
  // static const String BASE_URL ='http://10.0.2.2:8080/nc/restapi_fPfs/api/v1';

  // static const String TOKEN_VALUE = 'M8mSRkfnNGUzTNlnocZ5prwkbh9CKZkHqpVCgD57';     //home

  static Future<List<UsersModel>> getUsers() async {
    final http.Response response = await http.get(
      Uri.parse(BASE_URL + '/Users'),
      headers: {
        "xc-token": TOKEN_VALUE,
      },
    );

    if (response.statusCode == 200) {
      return usersModelFromJson(response.body);
    } else
      throw ("İstek durumu başarısız oldu: ${response.statusCode}");
  }

  static Future<bool> createUser(name, email, password) async {
    final dynamic date = DateTime.now();
    Map data = {
      'name': name,
      'password': password,
      'recordingDate': date.toString(),
      'email': email
    };
    final http.Response response =
        await http.post(Uri.parse(BASE_URL + '/Users'),
            headers: {
              "xc-token": TOKEN_VALUE,
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(data));

    if (response.statusCode == 200) {
      return true;
    } else
      throw ("İstek durumu başarısız oldu: ${response.statusCode}+ ${response.body}");
  }

  static Future<List<TodosModel>> getTodos() async {
    final http.Response response = await http.get(
      Uri.parse(BASE_URL + '/Todo'),
      headers: {
        "xc-token": TOKEN_VALUE,
      },
    );

    if (response.statusCode == 200) {
      return todosModelFromJson(response.body);
    } else
      throw ("İstek durumu başarısız oldu: ${response.statusCode}");
  }
}
