import 'dart:convert';

EmployeeData employeeDataFromJson(String str) => EmployeeData.fromJson(json.decode(str));

String employeeDataToJson(EmployeeData data) => json.encode(data.toJson());

class EmployeeData {
  String? status;
  List<Employee>? data;
  String? message;

  EmployeeData({
    this.status,
    this.data,
    this.message,
  });

  factory EmployeeData.fromJson(Map<String, dynamic> json) => EmployeeData(
    status: json["status"],
    data: json["data"] == null ? [] : List<Employee>.from(json["data"]!.map((x) => Employee.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class Employee {
  int? id;
  String? employeeName;
  int? employeeSalary;
  int? employeeAge;
  String? profileImage;

  Employee({
    this.id,
    this.employeeName,
    this.employeeSalary,
    this.employeeAge,
    this.profileImage,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    id: json["id"],
    employeeName: json["employee_name"],
    employeeSalary: json["employee_salary"],
    employeeAge: json["employee_age"],
    profileImage: json["profile_image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "employee_name": employeeName,
    "employee_salary": employeeSalary,
    "employee_age": employeeAge,
    "profile_image": profileImage,
  };
}
