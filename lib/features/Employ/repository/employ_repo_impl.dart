import 'package:smile_temp/features/Employ/model/employ_model.dart';
import 'package:smile_temp/features/Employ/repository/employ_repo.dart';

import '../../../config/data/remote/network/ApiEndPoints.dart';
import '../../../config/data/remote/network/BaseApiService.dart';
import '../../../config/serviceLocator/serviceLocatorRegistory.dart';
import '../../../utils/logger.dart';

class EmployeeRepoImp implements EmployeeRepo{

  final _apiService = serviceLocator<BaseApiService>();


  @override
  Future<EmployeeData?> getEmployeeData() async {
    try {
      dynamic response = await _apiService.getResponse(
          ApiEndPoints().getEmployees);
      logger.i("Smile $response");
      final jsonData = EmployeeData.fromJson(response);
      return jsonData;
    } catch (e) {
      logger.e("Smile-E $e}");
      rethrow;
    }
  }

  @override
  List<Employee>? getFilteredList(int minAge, int maxAge,List<Employee> empList) {
    logger.i('getFilteredList for MinAge:$minAge MaxAge:$maxAge');
     return empList.where((element) =>(element.employeeAge!>=minAge && element.employeeAge!<=maxAge)).toList();
  }

}
