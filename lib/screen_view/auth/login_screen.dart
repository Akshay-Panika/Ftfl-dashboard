import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ftfl_dashboard/custom_widget/custom_hw.dart';

import '../../custom_widget/custom_card.dart';
import '../../custom_widget/custom_colors.dart';
import '../../custom_widget/custom_text_padding.dart';
import '../../custom_widget/custom_textstyle.dart';
import '../../custom_widget/custtom_navigate.dart';
import '../dashboard/dashboard_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  final _userIdController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _userIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColor.whiteColor,
      body: ListView(
        children: [
          screenWidth.width > 500 ? 100.height : 0.height,

            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              children: [

                /// Banner
                Container(
                  height: 500,width: 500,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade500,
                    borderRadius: screenWidth.width > 500 ? BorderRadius.only(
                      topLeft: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                    ) : null,
                    border: Border(
                        left: BorderSide(color: Colors.black,width: 0.5),
                        top: BorderSide(color: Colors.black, width: 0.5),
                        bottom: BorderSide(color: Colors.black, width: 0.5),
                    )
                  ),

                  child: Center(
                    child: Text("Logo!", style: TextStyle(fontSize: 50,color: Colors.black,fontWeight: FontWeight.w700),),
                  ),
                ),



                /// Log in
                Container(
                  height: 500,width: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:screenWidth.width > 500 ? BorderRadius.only(
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ): null,
                      border: Border(
                        right: BorderSide(color: Colors.black,width: 0.5),
                        top: BorderSide(color: Colors.black, width: 0.5),
                        bottom: BorderSide(color: Colors.black, width: 0.5),
                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      /// Logo
                      Align(
                        alignment: Alignment.topRight,
                        child: textPaddingWidget(text: 'FTFL Technology',
                        textStyle: textStyle18(fontWeight: FontWeight.w700, color: Colors.blue),
                        padding: EdgeInsets.only(right: 20,top: 20)),
                      ),


                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Text("Admin User Log In", style: textStyle14(fontWeight: FontWeight.w700),),
                            ),

                            Form(
                                key: _formKey,
                                child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30.0,),
                              child: Column(
                                children: [

                                  40.height,
                                  /// User ID Field
                                  TextFormField(
                                    controller: _userIdController,
                                    style: textStyle16(),
                                    decoration: InputDecoration(
                                      hintText: 'Enter User ID',
                                      prefixIcon: Icon(Icons.person,  color: Colors.blue.shade500,),
                                      hintStyle: textStyle16()
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter User ID';
                                      }
                                      return null;
                                    },
                                  ),
                                  10.height,

                                  /// Password Field
                                  TextFormField(
                                    controller: _passwordController,
                                    obscureText: !_isPasswordVisible,
                                    style: textStyle16(),
                                    decoration: InputDecoration(
                                        hintText: 'User Password',
                                        hintStyle: textStyle16(),
                                        prefixIcon: Icon(Icons.lock,  color: Colors.blue.shade500,),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _isPasswordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.blue.shade500,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _isPasswordVisible = !_isPasswordVisible;
                                          });
                                        },
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter Password';
                                      }
                                      if (value.length < 8) {
                                        return 'Password must be at least 8 characters';
                                      }
                                      return null;
                                    },
                                  ),
                                  10.height,
                                  Text(
                                    "Make sure your password contains at least 8 characters for security.",
                                    style: textStyle12(color: Colors.grey),
                                  ),

                                  40.height,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomCard(
                                         color: Colors.blue.shade500,
                                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                                        child: Text("Log In", style: textStyle16(color: Colors.white),),
                                        onTap: () {
                                          if (_formKey.currentState!.validate()) {
                                            // Perform login action here
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(backgroundColor: Colors.white,
                                                  showCloseIcon: true,
                                                  closeIconColor: Colors.blue.shade900,
                                                  content: Text('Logging in...', style: textStyle12(color: Colors.black),)),
                                            );
                                            customNavigatePR(context, DashboardScreen());
                                          }
                                        },
                                      ),


                                       Text("Forgot Password", style: textStyle14(),),
                                    ],
                                  )
                                ],
                              ),
                            ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}
