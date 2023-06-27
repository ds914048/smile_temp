import 'package:flutter/material.dart';
import 'package:smile_temp/config/resources/AppContextExtension.dart';

import '../Employ/view_model/employ_provider.dart';

class EmployeeAgeFilter extends StatefulWidget {
   EmployeeAgeFilter({super.key,required this.employeeProvider});
   EmployeeProvider employeeProvider;

  @override
  State<EmployeeAgeFilter> createState() => _EmployeeAgeFilterState();
}

class _EmployeeAgeFilterState extends State<EmployeeAgeFilter> {
  RangeValues ageRange = const RangeValues(20, 110);



  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          ageFilterBottomSheet();
        },
        icon: const Icon(Icons.filter_alt_rounded));
  }

  Future<void> ageFilterBottomSheet() => showModalBottomSheet(
      context: context,
      builder: (BuildContext c) {
        return StatefulBuilder(
          builder: (BuildContext context, void Function(void Function()) setState) {
            return SizedBox(
              height: 250,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    child: SizedBox(
                      height: 180,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            'Employee Age Range',
                            style: context.resources.textStyle.heading2,
                          ),
                          Center(
                            child: Text(
                              '${ageRange.start.round().toString()} - ${ageRange.end.round().toString()} Year\'s',
                              style: context.resources.textStyle.bodyText2,
                            ),
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.pink,
                              inactiveTrackColor: Color(0xFF8D8E98),
                              thumbColor: Color(0xFFEB1555),
                              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15),
                              overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
                              overlayColor: Color(0x29EB1555),
                              showValueIndicator: ShowValueIndicator.always,
                            ),
                            child: RangeSlider(
                              values: ageRange,
                              min: 20,
                              max: 110,
                              labels: RangeLabels('${ageRange.start.round()}',
                                  '${ageRange.end.round()}'),
                              // divisions: 10,
                              onChanged: (RangeValues newValue) {
                                setState(() {
                                  ageRange = newValue;
                                });
                              },
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: context.resources.color.primaryButton,
                                ),
                              onPressed: (){
                                widget.employeeProvider.getFilteredList(ageRange.start.round(), ageRange.end.round());
                                Navigator.pop(context);
                              },
                              child: Text('Filter Result',style: context.resources.textStyle.bodyText2,)
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      });
}
