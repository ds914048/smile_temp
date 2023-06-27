import '../model/employ_model.dart';

class EmployeeRepo{
  Future<EmployeeData?> getEmployeeData() async {}

  List<Employee>? getFilteredList(int minAge ,int maxAge,List<Employee> epmList){}
}