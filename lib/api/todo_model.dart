// To parse this JSON data, do
//
//     final todosModel = todosModelFromJson(jsonString);

import 'dart:convert';

List<TodosModel> todosModelFromJson(String str) =>
    List<TodosModel>.from(json.decode(str).map((x) => TodosModel.fromJson(x)));

String todosModelToJson(List<TodosModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodosModel {
  TodosModel({
    this.id,
    this.title,
    this.content,
    this.recordingDate,
    this.completed,
  });

  final int? id;
  final String? title;
  final String? content;
  final DateTime? recordingDate;
  final int? completed;

  factory TodosModel.fromJson(Map<String, dynamic> json) => TodosModel(
        id: json["Id"],
        title: json["Title"],
        content: json["Content"],
        recordingDate: DateTime.parse(json["RecordingDate"]),
        completed: json["Completed"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Title": title,
        "Content": content,
        "RecordingDate": recordingDate!.toIso8601String(),
        "Completed": completed,
      };
}
