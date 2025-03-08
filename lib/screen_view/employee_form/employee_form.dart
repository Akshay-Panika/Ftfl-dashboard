import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:html' as html;
import '../../custom_widget/custom_container.dart';
import '../../custom_widget/custom_textstyle.dart';

class EmployeeForm extends StatefulWidget {
  bool addEmployee;
   EmployeeForm({super.key, required this.addEmployee});

  @override
  _EmployeeFormState createState() => _EmployeeFormState();
}

class _EmployeeFormState extends State<EmployeeForm> {
  int? _selectedGender;
  int? _selectedMaritalStatus;
  String? _selectedDepartment;

  String? _imageUrl;
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

  /// Function to Pick Image
  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        _imageUrl = html.Url.createObjectUrlFromBlob(html.Blob([result.files.first.bytes!]));
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return CustomContainer(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade400)
      ),
      margin:  height > 500
          ? EdgeInsets.only(left: 40, right: 40, bottom: 40)
          : EdgeInsets.only(left: 10, right: 10),
      padding: height > 500
          ? EdgeInsets.only(left: 40, right: 40, top: 20)
          : EdgeInsets.only(left: 10, right: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            Center(child: Text('Register Employees', style: textStyle16(fontWeight: FontWeight.w500),)),
            SizedBox(height: height*0.03),
            Text('Employee Id, 01', style: textStyle14(fontWeight: FontWeight.w500),),


            Row(
              children: [
                Expanded(child: _textField(headline: 'Full Name',),),
                SizedBox(width: width * 0.02),
                Expanded(child: _textField(headline: 'Email Id'),),
                SizedBox(width: width * 0.02),
                Column(
                  children: [
                    if (_imageUrl == null)
                      InkWell(
                        onTap: _pickImage,
                        child: Container(
                          width: height*0.1,
                          height: height*0.1,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            border: Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(height*0.02),
                          ),
                          child: Icon(CupertinoIcons.profile_circled, color: Colors.grey, size: height*0.05,),
                        ),
                      ),
                    if (_imageUrl != null)
                      InkWell(
                        onTap: _pickImage,
                        child: Container(
                          width: height*0.1,
                          height: height*0.1,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              border: Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(height*0.02),
                              image: DecorationImage(image: NetworkImage(_imageUrl!), fit: BoxFit.cover)
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
        
            SizedBox(height: height*0.02),
        
            /// Email And Phone
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _dobController,
                    readOnly: true,
                    onTap: () => _selectDobDate(context),
                    decoration: InputDecoration(
                      label: Text('Date Of Birth',style: textStyle14(fontWeight: FontWeight.w400),),
                      border: UnderlineInputBorder(),
                      suffixIcon: Icon(CupertinoIcons.calendar),
                    ),
                  ),
                ),
                SizedBox(width: width*0.02,),
                Expanded(child: _textField(headline: 'Phone No'),),
        
              ],
            ),
            SizedBox(height: height*0.03),
        
            /// Gender Selection And Marital Status
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Gender', style: textStyle14(fontWeight: FontWeight.w400)),
                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {_selectedGender = value as int?;});
                          },
                        ),
                        Text("Male", style: textStyle14(fontWeight: FontWeight.w400)),
                        const SizedBox(width: 20),
                        Radio(
                          value: 2,
                          groupValue: _selectedGender,
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value as int?;
                            });
                          },
                        ),
                        Text("Female", style: textStyle14(fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: width * 0.05),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Marital Status', style: textStyle14(fontWeight: FontWeight.w400)),
                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: _selectedMaritalStatus,
                          onChanged: (value) {
                            setState(() {_selectedMaritalStatus = value as int?;});
                          },
                        ),
                        Text("Single", style: textStyle14(fontWeight: FontWeight.w400)),
                        const SizedBox(width: 40),
                        Radio(
                          value: 2,
                          groupValue: _selectedMaritalStatus,
                          onChanged: (value) {
                            setState(() {
                              _selectedMaritalStatus = value as int?;
                            });
                          },
                        ),
                        Text("Married", style: textStyle14(fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: width * 0.08),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedDepartment,
                    decoration: InputDecoration(
                        label: Text('Department',style: textStyle14(fontWeight: FontWeight.w400),),
                        border: UnderlineInputBorder()),
                    items: ['HR', 'IT', 'Finance', 'Marketing']
                        .map((dept) => DropdownMenuItem(value: dept, child: Text(dept, style: textStyle14(fontWeight: FontWeight.w400),)))
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
        
            SizedBox(height: height*0.02),
        
            /// Department Selection and Date of Birth
            Row(
              children: [
                Expanded(child: _textField(headline: 'Job Roll'),),
                SizedBox(width: width * 0.02),
                Expanded(
                  child:TextFormField(
                    controller: _joiningController,
                    readOnly: true,
                    onTap: () => _selectJoiningDate(context),
                    decoration: InputDecoration(
                      label: Text('Joining Date',style: textStyle14(fontWeight: FontWeight.w400),),
                      border: UnderlineInputBorder(),
                      suffixIcon: Icon(CupertinoIcons.calendar),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: height*0.02),
        
            /// Address
            Row(
              children: [
                Expanded(child: _textField(headline: 'Adhar Number',)),
                SizedBox(width: width * 0.02),
                Expanded(child: _textField(headline: 'Employee Address',)),
              ],
            ),
            SizedBox(height: height*0.03),
        
            /// Submit Button
            Align(
              alignment: Alignment.bottomRight,
              child: CustomContainer(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(15)
                ),
                onTap: () {
                  setState(() {
                    widget.addEmployee = false;
                  });
                },
                child: Text(' Save Data', style: textStyle14(color: Colors.white,fontWeight: FontWeight.w500),),
              ),
            ),
            SizedBox(height: height*0.01),
          ],
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
