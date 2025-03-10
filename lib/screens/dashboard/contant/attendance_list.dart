import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ftfl_dashboard/app_widget/custom_hw.dart';
import 'package:ftfl_dashboard/app_widget/custom_textstyle.dart';
import 'package:ftfl_dashboard/app_widget/dimands.dart';

import '../../../app_widget/custom_container.dart';
import '../../../app_widget/custom_text_form_field.dart';
import '../../../core/theme.dart';

class AttendanceList extends StatefulWidget {
  const AttendanceList({super.key});

  @override
  State<AttendanceList> createState() => _AttendanceListState();
}
class _AttendanceListState extends State<AttendanceList> {

  final TextEditingController _searchController = TextEditingController();
  List<String> employeeList = List.generate(10, (index) => 'Employee ${index + 1}');
  List<String> filteredList = [];

  bool _addEmployee = false;
  List<bool> isSelectedList = List.generate(10, (index) => false);

  @override
  void initState() {
    super.initState();
    filteredList = employeeList;
  }

  void _filterEmployees(String query) {
    setState(() {
      filteredList = employeeList
          .where((employee) => employee.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    Demands demands = Demands(context);
    return Column(
      children: [
        /// Search Bar, Filter,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: customContainer(
                bRadius: demands.screenHeight*0.01,
                hMargin: demands.screenWidth*0.01,
                hPadding: demands.screenWidth*0.025,
                height:demands.screenHeight*0.05,
                borderColor: customColor.borderColor,
                shadowColor: Colors.transparent,
                child: CustomTextFormField(
                  hintText: 'Search employee',
                  keyboardType: TextInputType.text,
                  showBorder: false,
                  suffixIcon: CupertinoIcons.search,
                  controller: _searchController,
                  onChanged: _filterEmployees,
                  readOnly:  _addEmployee?true:false,
                ),
              ),
            ),
            customContainer(
              bRadius: demands.screenHeight*0.01,
              hMargin: demands.screenWidth*0.01,
              hPadding: demands.screenWidth*0.025,
              height:demands.screenHeight*0.05,
              borderColor: customColor.borderColor,
              shadowColor: Colors.transparent,
              child: Row(
                children: [
                  Padding(padding: const EdgeInsets.only(right: 8.0), child: Icon(Icons.filter_alt_sharp, size: 15),),
                  Text("Filter", style: textStyle12(context,)),
                ],
              ),
            )
          ],
        ),

        SizedBox(height: demands.screenWidth>600?demands.screenHeight*0.0:demands.screenHeight*0.01,),
        Expanded(
          child: customContainer(
            bRadius: demands.screenHeight*0.01,
            hMargin: demands.screenWidth*0.01, vMargin: demands.screenWidth*0.01,
            vPadding: demands.screenWidth*0.01,
            hPadding: demands.screenWidth*0.025,
            borderColor: customColor.borderColor,
            shadowColor: Colors.transparent,
            child: Column(
              children: [
          
                /// Headline
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width:demands.screenWidth>600?demands.screenWidth*0.03: demands.screenWidth*0.06,
                        child: Text("No.", style: textStyle12(context,fontWeight: FontWeight.w600),)),
                    Expanded(flex: demands.screenWidth>600?2:1,
                        child: Text("Name", style: textStyle12(context,fontWeight: FontWeight.w600),)),
                    Expanded(child: Text(demands.screenWidth>600?'Department':'Dept.', style: textStyle14(context,color: Colors.black))),
                    Expanded(child: Text("Time In", style: textStyle12(context,fontWeight: FontWeight.w600),)),
                    Expanded(child: Text("Time Out", style: textStyle12(context,fontWeight: FontWeight.w600),)),
                    Text('Actions', style: textStyle14(context,fontWeight: FontWeight.w600)),
                  ],
                ),
          
                SizedBox(height: demands.screenHeight*0.02,),
          
                filteredList.isEmpty
                    ? Expanded(child: Center(child: Text('No Employees Found', style: textStyle14(context,color: Colors.black),)),)
                    : Expanded(
                  child: ListView.builder(
                    itemCount: filteredList.length,
                    itemBuilder: (context, index) {
                      var srNumber = index+1;
                      return Padding(
                        padding:  EdgeInsets.only(bottom: demands.screenHeight*0.02),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width:demands.screenWidth>600?demands.screenWidth*0.03:demands.screenWidth*0.06, child: Text(srNumber.toString(), style: textStyle12(context),)),
          
                            Expanded(
                              flex: demands.screenWidth>600?2:1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(filteredList[index], style: textStyle12(context),),
                                  Text("Job Roll:Flutter Developer", style: textStyle12(context, color: Colors.grey),),
                                ],
                              ),
                            ),
                            Expanded(child: Text("IT", style: textStyle12(context),)),
                            Expanded(child: Text("9:55, AM", style: textStyle12(context),)),
                            Expanded(child: Text("6:00, PM", style: textStyle12(context),)),
                            ToggleButtons(
                              borderColor: Colors.transparent, selectedBorderColor: Colors.transparent,
                              fillColor: Colors.transparent, splashColor: Colors.transparent,
                              isSelected: [isSelectedList[index]], // Set state per row
                              onPressed: (int btnIndex) {
                                setState(() {
                                  isSelectedList[index] = !isSelectedList[index]; // Toggle ON/OFF
                                });
                              },
                              children: [
                                Icon(
                                  isSelectedList[index] ? Icons.toggle_on : Icons.toggle_off,
                                  color: isSelectedList[index] ? Colors.black : Colors.grey, size: 35,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),

      ],
    );
  }
}
