import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ftfl_dashboard/app_widget/custom_container.dart';
import 'package:ftfl_dashboard/app_widget/custom_hw.dart';
import 'package:ftfl_dashboard/app_widget/custom_text_form_field.dart';
import 'package:ftfl_dashboard/core/theme.dart';
import '../../../app_widget/custom_textstyle.dart';
import '../../../app_widget/dimands.dart';
import '../../employee_form/employee_form.dart';

class Employee extends StatefulWidget {
  const Employee({super.key});

  @override
  _EmployeeState createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Headline
        Padding(
          padding: EdgeInsets.only(left: 20, top: 20),
          child: Text('Employee List', style: textStyle16(context),),
        ),


        /// Search Bar, Add Employee, Filter, Export Buttons
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: demands.screenWidth>600?demands.screenWidth*0.01:demands.screenWidth*0.01),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: customContainer(
                  bRadius: demands.screenHeight*0.01,
                  borderColor: customColor.borderColor,
                  shadowColor: Colors.transparent,
                  hMargin: demands.screenWidth*0.01,
                  vMargin: demands.screenWidth*0.02,
                  hPadding:demands.screenWidth*0.02,
                  height:demands.screenHeight*0.05,
                  child: CustomTextFormField(
                      hintText: 'Search employee',
                      keyboardType: TextInputType.text,
                      suffixIcon: demands.screenWidth > 600 ?_addEmployee?CupertinoIcons.clear:CupertinoIcons.search:null,
                    controller: _searchController,
                    onChanged: _filterEmployees,
                    showBorder: false,
                    readOnly:  _addEmployee?true:false,
                  )
                ),
              ),
              Row(
                children: [
                  _addEmployee?
                  customContainer(
                    bRadius: demands.screenHeight*0.01,
                    borderColor: customColor.borderColor,
                    shadowColor: Colors.transparent,
                    hMargin: demands.screenWidth*0.01,
                    vMargin: demands.screenWidth*0.02,
                    hPadding:demands.screenWidth*0.02,
                    height:demands.screenHeight*0.05,
                    onTap: () {
                      _addEmployee =false;
                      setState(() {});
                    },
                    child: Row(
                      children: [
                        demands.screenWidth>600?
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.arrow_back, size: 15),
                        ):SizedBox(),
                        Text("Back", style: textStyle12(context,)),
                      ],
                    ),
                  ):SizedBox(),
                  customContainer(
                    bRadius: demands.screenHeight*0.01,
                    borderColor: customColor.borderColor,
                    shadowColor: Colors.transparent,
                    hMargin: demands.screenWidth*0.01,
                    vMargin: demands.screenWidth*0.02,
                    hPadding:demands.screenWidth*0.02,
                    height:demands.screenHeight*0.05,
                    child: Row(
                      children: [
                        demands.screenWidth>600?
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.add, size: 15),
                        ):SizedBox(),
                        Text("Add Employee", style: textStyle12(context,)),
                      ],
                    ),
                    onTap: () {
                      _addEmployee = true;
                      setState(() {});
                    },

                  ),
                  customContainer(
                    bRadius: demands.screenHeight*0.01,
                    borderColor: customColor.borderColor,
                    shadowColor: Colors.transparent,
                    hMargin: demands.screenWidth*0.01,
                    vMargin: demands.screenWidth*0.02,
                    hPadding:demands.screenWidth*0.02,
                    height:demands.screenHeight*0.05,
                    child: Row(
                      children: [
                        demands.screenWidth>600?
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.filter_alt_sharp, size: 15),
                        ):SizedBox(),
                        Text("Filter", style: textStyle12(context,)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        /// Employee List
        _addEmployee?
        EmployeeForm(addEmployee: _addEmployee,):
        Expanded(
          child: customContainer(
            bRadius: demands.screenHeight*0.01,
            borderColor: customColor.borderColor,
            shadowColor: Colors.transparent,
            hMargin: demands.screenWidth*0.02,
           // vMargin: demands.screenWidth*0.02,
            hPadding:demands.screenWidth*0.02,
            height:demands.screenHeight*0.05,
            child: filteredList.isEmpty
                ? Center(child: Text('No Employees Found', style: textStyle14(context,color: Colors.black),),)
                :  Column(
              children: [

                SizedBox(height: demands.screenHeight*0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: demands.screenWidth>600?50:30, child: Text('SR', style: textStyle14(context,color: Colors.black))),
                    Expanded(child: Text('Name', style: textStyle14(context,color: Colors.black))),
                    Expanded(child: Text('Phone No', style: textStyle14(context,color: Colors.black))),
                    demands.screenWidth>600?Expanded(child: Text('Email Id', style: textStyle14(context,color: Colors.black))):SizedBox(),
                    Expanded(child: Center(child: Text(demands.screenWidth>600?'Department':'Dept.', style: textStyle14(context,color: Colors.black)))),
                    demands.screenWidth>600? Expanded(child: Text('Workplace', style: textStyle14(context,color: Colors.black))):SizedBox(),
                   demands.screenWidth>600? Expanded(child: Text('Address', style: textStyle14(context,color: Colors.black))):SizedBox(),
                    Expanded(child: Align(
                        alignment: Alignment.topRight,
                        child: Text('Actions', style: textStyle14(context,color: Colors.black)))),
                  ],
                ),
                SizedBox(height: demands.screenHeight*0.02,),

                Expanded( // Prevents overflow issue
                  child: ListView.builder(
                    itemCount: filteredList.length,
                    itemBuilder: (context, index) {
                      var srNumber = index+1;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: demands.screenWidth>600?50:30,
                              child: Text(srNumber.toString(), style: textStyle14(context,fontWeight: FontWeight.w400))),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(filteredList[index], style: textStyle14(context)),
                                Text('Role: Flutter Developer', style: textStyle12(context,color: Colors.black54)),
                              ],
                            ),
                          ),
                          Expanded(child: Text('898920777$index', style: textStyle14(context,fontWeight: FontWeight.w400),textAlign: TextAlign.justify,)),
                          demands.screenWidth>600? Expanded(child: Text('Akshay$index@gmail.com', style: textStyle14(context,fontWeight: FontWeight.w400))):SizedBox(),
                          Expanded(child: Center(child: Text('IT', style: textStyle14(context,fontWeight: FontWeight.w400)))),
                          demands.screenWidth>600? Expanded(child: Text('Head Office', style: textStyle14(context,fontWeight: FontWeight.w400))):SizedBox(),
                          demands.screenWidth>600? Expanded(child: Text('Baliari Road,Waidhan, Singrauli, MP', style: textStyle14(context,fontWeight: FontWeight.w400))):SizedBox(),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: ToggleButtons(
                                borderColor: Colors.transparent,
                                selectedBorderColor: Colors.transparent,
                                fillColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                isSelected: [isSelectedList[index]], // Set state per row
                                onPressed: (int btnIndex) {
                                  setState(() {
                                    isSelectedList[index] = !isSelectedList[index]; // Toggle ON/OFF
                                  });
                                },
                                children: [
                                  Icon(
                                    isSelectedList[index] ? Icons.toggle_on : Icons.toggle_off,
                                    size: 35,
                                    color: isSelectedList[index] ? Colors.black : Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        20.height
      ],
    );
  }
}