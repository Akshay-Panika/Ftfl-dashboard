import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../custom_widget/custom_card.dart';
import '../../../custom_widget/custom_decoration.dart';
import '../../../custom_widget/custom_text_padding.dart';
import '../../../custom_widget/custom_textstyle.dart';
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
    final height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textPaddingWidget(
          text: 'Employee List',
          textStyle: textStyle20(color: Colors.black),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Search Bar
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40, bottom: 10),
                child: Container(
                  height: 38,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: 0.5),
                  ),
                  child: TextField(
                    controller: _searchController,
                    style: textStyle14(),
                    onChanged: _filterEmployees,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search here..',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),

            /// Add Employee, Filter, Export Buttons
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40, bottom: 10),
              child: Row(
                children: [
                  _addEmployee?
                  CustomCard(
                    onTap: () {
                      _addEmployee =false;
                      setState(() {});
                    },
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back, size: 15),
                        SizedBox(width: 10),
                        Text("Back", style: textStyle12()),
                      ],
                    ),
                  ):SizedBox(),
                  CustomCard(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Icon(Icons.add, size: 15),
                        SizedBox(width: 10),
                        Text("Add Employee", style: textStyle12()),
                      ],
                    ),
                    onTap: () {
                      _addEmployee = true;
                      setState(() {});
                    },

                  ),
                  CustomCard(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Icon(Icons.filter_alt_sharp, size: 15),
                        SizedBox(width: 10),
                        Text("Filter", style: textStyle12()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        /// Employee List
        _addEmployee?
        EmployeeForm(addEmployee: _addEmployee,):
        Expanded(
          child: Container(
            margin: height > 500
                ? EdgeInsets.only(left: 40, right: 40, bottom: 40) : EdgeInsets.only(left: 10, right: 10),
            decoration: customDecoration(
              color: Colors.white,
              borderRadius: 20,
              borderColor: Colors.grey,
              borderWidth: 0.5,
            ),
            child: filteredList.isEmpty
                ? Center(child: Text('No Employees Found', style: textStyle14(color: Colors.black),),)
                :  Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 50,
                          child: Text('SR', style: textStyle14(color: Colors.black))),
                      Expanded(child: Text('Name', style: textStyle14(color: Colors.black))),
                      Expanded(child: Text('Phone No', style: textStyle14(color: Colors.black))),
                      Expanded(child: Text('Email Id', style: textStyle14(color: Colors.black))),
                      Expanded(child: Text('Department', style: textStyle14(color: Colors.black))),
                      Expanded(child: Text('Workplace', style: textStyle14(color: Colors.black))),
                      Expanded(child: Text('Address', style: textStyle14(color: Colors.black))),
                      Expanded(child: Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text('Actions', style: textStyle14(color: Colors.black)),
                          ))),
                    ],
                  ),
                ),
                Expanded( // Prevents overflow issue
                  child: ListView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: filteredList.length,
                    itemBuilder: (context, index) {
                      var srNumber = index+1;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: 50,
                                child: Text(srNumber.toString(), style: textStyle14(fontWeight: FontWeight.w400))),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(filteredList[index], style: textStyle14(fontWeight: FontWeight.w600)),
                                  Text('Role: Flutter Developer', style: textStyle12(color: Colors.grey)),
                                ],
                              ),
                            ),
                            Expanded(child: Text('+91 898920777$index', style: textStyle14(fontWeight: FontWeight.w400))),
                            Expanded(child: Text('Akshay$index@gmail.com', style: textStyle14(fontWeight: FontWeight.w400))),
                            Expanded(child: Text('         ${'IT'}', style: textStyle14(fontWeight: FontWeight.w400))),
                            Expanded(child: Text('Workplace', style: textStyle14(fontWeight: FontWeight.w400))),
                            Expanded(child: Text('Baliari Road,Waidhan, Singrauli, MP', style: textStyle14(fontWeight: FontWeight.w400))),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
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
                                        size: 30,
                                        color: isSelectedList[index] ? Colors.blue : Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}