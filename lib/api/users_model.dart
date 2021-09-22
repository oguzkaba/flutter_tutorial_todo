// To parse this JSON data, do
//
//     final UsersModel = UsersModelFromJson(jsonString);

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
    this.levelsId,
    this.personnelId,
  });

  int? id;
  String? name;
  String? password;
  DateTime? recordingDate;
  int? levelsId;
  int? personnelId;

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        id: json["Id"],
        name: json["Name"],
        password: json["Password"],
        recordingDate: DateTime.parse(json["RecordingDate"]),
        levelsId: json["LevelsId"],
        personnelId: json["PersonnelId"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Password": password,
        "RecordingDate": recordingDate?.toIso8601String(),
        "LevelsId": levelsId,
        "PersonnelId": personnelId,
      };
}
