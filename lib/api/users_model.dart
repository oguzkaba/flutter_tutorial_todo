// To parse this JSON data, do
//
//     final usersModel = usersModelFromJson(jsonString);

import 'dart:convert';

List<UsersModel> usersModelFromJson(String str) =>
    List<UsersModel>.from(json.decode(str).map((x) => UsersModel.fromJson(x)));

String usersModelToJson(List<UsersModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UsersModel {
  UsersModel({
    this.id,
    this.name,
    this.password,
    this.recordingDate,
    this.email,
  });

  final int? id;
  final String? name;
  final String? password;
  final DateTime? recordingDate;
  final String? email;

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        id: json["Id"],
        name: json["Name"],
        password: json["Password"],
        recordingDate: DateTime.parse(json["RecordingDate"]),
        email: json["Email"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Password": password,
        "RecordingDate": recordingDate!.toIso8601String(),
        "Email": email,
      };
}
