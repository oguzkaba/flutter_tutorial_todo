import 'package:flutter_tutorial_todo/api/users_model.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static const String BASE_URL =
      'http://10.0.2.2:8080/nc/appforapi_oDux/api/v1';
  static const String TOKEN_VALUE = 'YR-CRSieH1i-Eawj8e6-pC6GbOvUEKE_P5XIrPfT';

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

  static Future<List<UsersModel>> createUser(uname, email, pass) async {
    Map<UsersModel> data = {
      email: email,
      name: uname,
      password: pass,
      recordingDate: DateTime.now()
    }.;
    final http.Response response =
        await http.post(Uri.parse(BASE_URL + '/Users'),
            headers: {
              "xc-token": TOKEN_VALUE,
            },
            body: usersModelToJson(data));

    if (response.statusCode == 200) {
      return usersModelFromJson(response.body);
    } else
      throw ("İstek durumu başarısız oldu: ${response.statusCode}");
  }
}
