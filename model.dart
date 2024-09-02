// To parse this JSON data, do
//
//     final Employee = EmployeeFromJson(jsonString);

import 'dart:convert';

List<Employee> EmployeeFromJson(String str) =>
    List<Employee>.from(json.decode(str).map((x) => Employee.fromJson(x)));

String EmployeeToJson(List<Employee> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Employee {
  String name;
  int username;
  int id;
  String zipcode;

  Employee({
    required this.name,
    required this.username,
    required this.id,
    required this.zipcode,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        name: json["name"],
        username: json["username"],
        id: json["id"],
        zipcode: json["zipcode"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "username": username,
        "id": id,
        "zipcode": zipcode,
      };
}
