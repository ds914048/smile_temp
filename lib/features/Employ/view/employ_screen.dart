import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smile_temp/features/custom_widget/employee_age_filter.dart';
import '../../../config/resources/AppContextExtension.dart';
import '../../../generated/assets.dart';
import '../model/employ_model.dart';
import '../view_model/employ_provider.dart';

import '../../../config/data/remote/response/Status.dart';
import '../../../utils/logger.dart';
import '../../custom_widget/LoadingWidget.dart';
import '../../custom_widget/MyErrorWidget.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  final EmployeeProvider _employeeProvider = EmployeeProvider();
  late ScrollController _scrollController;

  @override
  void initState() {
    _employeeProvider.fetchEmployeeData();
    _scrollController = ScrollController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(context.resources.strings.employeeList),
        backgroundColor: context.resources.color.navigationBarBackground,
        actions:  [
          EmployeeAgeFilter(employeeProvider: _employeeProvider),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: ()async{
          _employeeProvider.fetchEmployeeData();
        },
        child: ChangeNotifierProvider<EmployeeProvider>.value(
          value: _employeeProvider,
          child: Consumer<EmployeeProvider>(builder: (context, data, _) {
            switch (data.employeeData.status) {
              case Status.LOADING:
                logger.w("Smile :: LOADING");
                return LoadingWidget();
              case Status.ERROR:
                logger.e("Smile :: ERROR");
                return SingleChildScrollView(child: MyErrorWidget(_employeeProvider.employeeData.message ?? "NA"));
              case Status.COMPLETED:
                logger.i("Smile :: COMPLETED");
                return _employeeListView(_employeeProvider.employeeList);
              default:
            }
            return Container();
          }),
        ),
      ),
    );
  }

  Widget _employeeListView(List<Employee>? employeeList) {
    return CupertinoScrollbar(
      controller: _scrollController,
      child: employeeList!.isNotEmpty?ListView.builder(
          controller: _scrollController,
          itemCount: employeeList.length,
          itemBuilder: (context, position) {
            return Padding(
              padding:  EdgeInsets.all(context.resources.dimension.defaultMargin),
              child: Row(
                children: [
                  ClipOval(
                      child: Image.asset(
                        Assets.iconsEmployeeIcon,
                        fit: BoxFit.cover,
                        width: 50.0,
                        height: 50.0,
                      )
                  ),
                  SizedBox(width: context.resources.dimension.defaultMargin,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${employeeList[position].employeeName}',style: context.resources.textStyle.bodyText1Bold,),
                      Text('Age :: ${employeeList[position].employeeAge}'),
                      Text('id :: ${employeeList[position].id}'),
                    ],
                  ),
                ],
              ),
            );
          }): Center(child: Text('Zero Employ Found',style: context.resources.textStyle.heading2,)),
    );
  }
}
