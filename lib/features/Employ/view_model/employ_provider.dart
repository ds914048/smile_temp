import 'package:flutter/material.dart';
import 'package:smile_temp/features/Employ/model/employ_model.dart';
import 'package:smile_temp/features/Employ/repository/employ_repo_impl.dart';
import 'package:smile_temp/utils/logger.dart';

import '../../../config/data/remote/response/ApiResponse.dart';
class EmployeeProvider extends ChangeNotifier {
  final _employeeRepo = EmployeeRepoImp();

  ApiResponse<EmployeeData> employeeData = ApiResponse.loading();
  List<Employee>? employeeList = [];

  void _setEmployeeData(ApiResponse<EmployeeData> response) {
    print("Smile :: $response");
    employeeData = response;
    employeeList=response.data?.data;
    notifyListeners();
  }

  Future<void> fetchEmployeeData() async {
    _setEmployeeData(ApiResponse.loading());
    _employeeRepo.getEmployeeData()
        .then((value) => _setEmployeeData(ApiResponse.completed(value)))
        .onError((error, stackTrace) => _setEmployeeData(ApiResponse.error(error.toString())));
  }

  List<Employee>? getFilteredList(int minAge ,int maxAge){
    var newList =_employeeRepo.getFilteredList(minAge, maxAge, employeeData.data?.data??[]);
    employeeList=newList;
    notifyListeners();
    logger.i('<<<<<<<<<<<<<<<<<<<<<<${newList?.length}>>>>>>>>>>>>>>>>>>>>>>');
  }

}