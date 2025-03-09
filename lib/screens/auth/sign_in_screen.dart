import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ftfl_dashboard/app_widget/custom_container.dart';
import 'package:ftfl_dashboard/app_widget/custom_hw.dart';
import 'package:ftfl_dashboard/app_widget/dimands.dart';
import 'package:ftfl_dashboard/core/theme.dart';
import '../../app_widget/custom_card.dart';
import '../../app_widget/custom_text_form_field.dart';
import '../../app_widget/custom_textstyle.dart';
import '../../app_widget/custtom_navigate.dart';
import '../dashboard/dashboard_screen.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}
class _SignInScreenState extends State<SignInScreen> {

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

    Demands demands = Demands(context);

    return Scaffold(
      backgroundColor: customColor.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: customContainer(bRadius: demands.screenHeight*0.02,
             height: demands.screenWidth > 600? demands.screenHeight*0.6: demands.screenHeight*0.75,
             width: demands.screenWidth > 600? demands.screenWidth*0.5: demands.screenWidth*0.9,
              containerColor: Colors.white,
              borderColor: customColor.borderColor,
              child: Flex(
                  direction: demands.screenWidth > 600? Axis.horizontal:Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                      flex: 1,
                      child: ClipRRect(borderRadius: BorderRadius.circular(demands.screenHeight*0.02),child: Image.asset('assets/logo/ftfl_logo.jpg',))),
                  Expanded(flex: demands.screenWidth>600 ?1:2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        /// Headline
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, bottom: 20),
                          child: Text('Admin User Log In',style: textStyle14(context,),),
                        ),

                       // SizedBox(height: demands.screenWidth > 600 ?demands.screenHeight*0.20:demands.screenHeight*0.0,),
                        Form(
                          key: _formKey,
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: demands.screenWidth>600 ? demands.screenWidth*0.02:demands.screenWidth*0.1),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CustomTextFormField(
                                  controller: _userIdController,
                                  prefixIcon: Icons.person,
                                  hintText: 'User ID',
                                  showBorder: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter User ID';
                                    }
                                    return null;
                                  },
                                ),
                                20.height,
                                CustomTextFormField(
                                  controller: _passwordController,
                                  obscureText: !_isPasswordVisible,
                                  prefixIcon: Icons.lock,
                                  hintText: 'Password',
                                  showBorder: true,
                                  suffixIcon:  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                  visibility: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
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
                                  style: textStyle12(context,color: Colors.grey),
                                ),

                                30.height,
                                customContainer(
                                  bRadius: demands.screenHeight*0.02,
                                  hPadding: demands.screenHeight*0.05,
                                  vPadding: demands.screenHeight*0.005,
                                  borderColor: customColor.borderColor,
                                  containerColor: Colors.black,
                                  onTap: () {
                                    if (_formKey.currentState?.validate() ?? false) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => DashboardScreen()),
                                      );
                                    }
                                  },
                                  child: Text('Sign In', style: textStyle12(context, color: Colors.white),),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}
