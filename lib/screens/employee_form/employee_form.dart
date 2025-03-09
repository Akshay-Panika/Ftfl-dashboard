import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ftfl_dashboard/app_widget/custom_hw.dart';
import 'package:intl/intl.dart';
import '../../app_widget/custom_container.dart';
import '../../app_widget/custom_textstyle.dart';
import '../../app_widget/dimands.dart';
import '../../core/theme.dart';

class EmployeeForm extends StatefulWidget {
  final bool addEmployee;

  const EmployeeForm({super.key, required this.addEmployee});

  @override
  _EmployeeFormState createState() => _EmployeeFormState();
}

class _EmployeeFormState extends State<EmployeeForm> {

  int? _selectedGender;
  int? _selectedMaritalStatus;
  String? _selectedDepartment;

  DateTime? _selectedDobDate;
  DateTime? _selectedJoiningDate;
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _joiningController = TextEditingController();

  /// Function to Pick DOB
  Future<void> _selectDobDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDobDate ?? DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _selectedDobDate = picked;
        _dobController.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  /// Function to Pick Joining Date
  Future<void> _selectJoiningDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedJoiningDate ?? DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _selectedJoiningDate = picked;
        _joiningController.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Demands demands = Demands(context);

    return Expanded(
      child: customContainer(
        bRadius: demands.screenHeight * 0.01,
        borderColor: customColor.borderColor,
        shadowColor: Colors.transparent,
        hMargin: demands.screenWidth * 0.02,
        hPadding: demands.screenWidth * 0.02,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.height,
              Center(child: Text('Register Employees', style: textStyle16(context, fontWeight: FontWeight.w500),),
              ),
              Text('Employee Id, 01', style: textStyle14(context, fontWeight: FontWeight.w500),),
            
            
              /// Text field form
              SizedBox(
                height: demands.screenWidth>600?demands.screenHeight*0.09:demands.screenHeight * 0.15,
               child: Row(
                 children: [
                   Expanded(
                     child: Flex(
                       direction: demands.screenWidth>600?Axis.horizontal:Axis.vertical,
                       children: [
                         Expanded(child: _textField(headline: 'Full Name'),),
                         30.width,
                         Expanded(child: _textField(headline: 'Email ID'),),
                       ],
                     ),
                   ),
                   customContainer(
                     bRadius: 15,
                     containerColor: Colors.grey,
                     child: Icon(Icons.person, color: Colors.white,),
                     height: demands.screenWidth>600?demands.screenWidth*0.4:demands.screenHeight*0.4,
                     width: demands.screenWidth>600?demands.screenWidth*0.05:demands.screenWidth*0.18,
                     hMargin: demands.screenWidth>600?demands.screenWidth*0.02:demands.screenWidth*0.05,
                   )
                 ],
               ),
             ),
              SizedBox(
                height: demands.screenWidth>600?demands.screenHeight*0.09:demands.screenHeight * 0.15,

                child: Flex(
                 direction: demands.screenWidth>600?Axis.horizontal:Axis.vertical,
                 children: [
                   Expanded(
                     child: TextFormField(
                       controller: _dobController,
                       readOnly: true,
                       onTap: () => _selectDobDate(context),
                       decoration: InputDecoration(
                         label: Text('Date Of Birth',style: textStyle14(context,fontWeight: FontWeight.w400),),
                         border: UnderlineInputBorder(),
                         suffixIcon: Icon(CupertinoIcons.calendar),
                       ),
                     ),
                   ),
                   30.width,
                   Expanded(
                     child: _textField(headline: 'Phone No'),
                   ),
                 ],
               ),
             ),
              SizedBox(
                height: demands.screenWidth>600?demands.screenHeight*0.09:demands.screenHeight * 0.15,
                child: Flex(
                 direction: demands.screenWidth>600?Axis.horizontal:Axis.vertical,
                 children: [
            
                   /// Gender Selection And Marital Status
                   Expanded(
                     child: Row(
                       children: [
                         Expanded(
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               demands.screenWidth>600?
                               Text('Gender', style: textStyle14(context,fontWeight: FontWeight.w400))
                               :10.height,
                               Row(
                                 children: [
                                   Radio(
                                     value: 1,
                                     groupValue: _selectedGender,
                                     onChanged: (value) {
                                       setState(() {_selectedGender = value as int?;});
                                     },
                                   ),
                                   Text("Male", style: textStyle14(context,fontWeight: FontWeight.w400)),
                                  10.width,
                                   Radio(
                                     value: 2,
                                     groupValue: _selectedGender,
                                     onChanged: (value) {
                                       setState(() {
                                         _selectedGender = value as int?;
                                       });
                                     },
                                   ),
                                   Text("Female", style: textStyle14(context,fontWeight: FontWeight.w400)),
                                 ],
                               ),
                             ],
                           ),
                         ),
            
                         Expanded(
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               demands.screenWidth>600?
                               Text('Marital Status', style: textStyle14(context,fontWeight: FontWeight.w400))
                               :10.height,
                               Row(
                                 children: [
                                   Radio(
                                     value: 1,
                                     groupValue: _selectedMaritalStatus,
                                     onChanged: (value) {
                                       setState(() {_selectedMaritalStatus = value as int?;});
                                     },
                                   ),
                                   Text("Single", style: textStyle14(context,fontWeight: FontWeight.w400)),
                                   10.width,
                                   Radio(
                                     value: 2,
                                     groupValue: _selectedMaritalStatus,
                                     onChanged: (value) {
                                       setState(() {
                                         _selectedMaritalStatus = value as int?;
                                       });
                                     },
                                   ),
                                   Text("Married", style: textStyle14(context,fontWeight: FontWeight.w400)),
                                 ],
                               ),
                             ],
                           ),
                         ),
                       ],
                     ),
                   ),
            
                   30.width,
                   Expanded(
                     child: DropdownButtonFormField<String>(
                       value: _selectedDepartment,
                       decoration: InputDecoration(
                           label: Text('Department',style: textStyle14(context,fontWeight: FontWeight.w400),),
                           border: UnderlineInputBorder()),
                       items: ['HR', 'IT', 'Finance', 'Marketing']
                           .map((dept) => DropdownMenuItem(value: dept, child: Text(dept, style: textStyle14(context,fontWeight: FontWeight.w400),)))
                           .toList(),
                       onChanged: (value) {
                         setState(() {
                           _selectedDepartment = value;
                         });
                       },
                     ),
                   ),
                 ],
               ),
             ),
              SizedBox(
                height: demands.screenWidth>600?demands.screenHeight*0.09:demands.screenHeight * 0.15,
               child: Flex(
                 direction: demands.screenWidth>600?Axis.horizontal:Axis.vertical,
                 children: [
                   Expanded(
                     child:_textField(headline: 'Job Roll'),
                   ),
                   30.width,
                   Expanded(
                     child:TextFormField(
                       controller: _joiningController,
                       readOnly: true,
                       onTap: () => _selectJoiningDate(context),
                       decoration: InputDecoration(
                         label: Text('Joining Date',style: textStyle14(context,fontWeight: FontWeight.w400),),
                         border: UnderlineInputBorder(),
                         suffixIcon: Icon(CupertinoIcons.calendar),
                       ),
                     ),
                   ),
                 ],
               ),
             ),
              SizedBox(
                height: demands.screenWidth>600?demands.screenHeight*0.09:demands.screenHeight * 0.15,
               child: Flex(
                 direction: demands.screenWidth>600?Axis.horizontal:Axis.vertical,
                 children: [
                   Expanded(
                     child: _textField(headline: 'Adhar Number'),
                   ),
                   30.width,
                   Expanded(
                     child: _textField(headline: 'Full Address'),
                   ),
                 ],
               ),
             ),
            
             Align(
               alignment: Alignment.bottomRight,
               child: customContainer(bRadius: 15,
                   containerColor: Colors.black,
                   vPadding: demands.screenWidth*0.002,
                   hPadding: demands.screenWidth*0.03,
                   vMargin: demands.screenWidth*0.02,
                   child: Text('Save Data', style: textStyle14(context, color: Colors.white),)),
             )
            ],
          ),
        ),
      ),
    );
  }
}


/// Text Field Widget
Widget _textField({
  String? headline,
  IconData? icons,
  TextInputType keyboardType = TextInputType.text,
  int maxLines = 1,
  bool? readOnly,
}) {
  return TextFormField(
    maxLines: maxLines,
    keyboardType: keyboardType,
    readOnly: readOnly??false,
    decoration: InputDecoration(
      label: Text(headline!, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),),
      prefixIcon: icons != null ? Icon(icons) : null,
      border: UnderlineInputBorder(),
      // focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black54)),
      // enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black54)),
    ),
  );
}