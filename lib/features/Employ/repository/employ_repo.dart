import '../model/employ_model.dart';

class EmployeeRepo{
  Future<EmployeeData?> getEmployeeData() async {}

  List<Employee>? getFilteredList(double minAge ,double maxAge,List<Employee> epmList){}
}