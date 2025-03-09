
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ftfl_dashboard/app_widget/custom_container.dart';
import 'package:ftfl_dashboard/app_widget/custom_hw.dart';
import '../../app_widget/custom_colors.dart';
import '../../app_widget/custom_textstyle.dart';
import '../../app_widget/dimands.dart';
import '../../core/theme.dart';
import 'contant/dashboard.dart';
import 'contant/drawer.dart';
import 'contant/emoloyee.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Employee(),
    Dashboard(),
  ];

  void _onMenuTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    Demands demands = Demands(context);


    return Scaffold(
      backgroundColor: customColor.backgroundColor,

      /// Appbar
      appBar: AppBar(
        toolbarHeight: demands.screenHeight*0.085,
        backgroundColor: Colors.white,
        shape: UnderlineInputBorder(borderSide: BorderSide(color: customColor.borderColor, width: 0.5)),
        title: Padding(
          padding: const EdgeInsets.all(20),
          child: Text("FTFL Technology", style: textStyle20(context,color: Colors.blue.shade900)),
        ),
        actions: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Akshay Panika", style: textStyle12(context,fontWeight: FontWeight.w600),
              ),
              Text(
                "App Developer",
                style: textStyle12(context, color: Colors.grey),
              ),
            ],
          ),
          10.width,
          CircleAvatar(
            radius: demands.screenHeight*0.035,
            backgroundImage: AssetImage('assets/images/akshay.jpg'),
          ),
          50.width
        ],
      ),

      ///  CustomDrawer
      drawer: demands.screenWidth > 600 ? null : CustomDrawer(),

      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// Side Menu
          demands.screenWidth > 600
              ? Expanded(
            flex: 1,
            child: customContainer(
              bRadius: 0,
              borderColor: customColor.borderColor,
              shadowColor: Colors.transparent,
              child:  Column(
                children: [

                  /// Dashboard
                  ListTile(
                    leading: Icon(Icons.dashboard),
                    title: Text('Dashboard',),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16,),
                    onTap: () => _onMenuTap(0),
                  ),

                 /// Employees
                  ExpansionTile(shape: InputBorder.none,
                    title: Text('Employees',),
                    leading: Icon(Icons.person),
                    iconColor: Colors.black,
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _textWidget(context,text: 'Employees list',onTap: () => _onMenuTap(1),),
                      _textWidget(context,text: 'Employees Leader'),
                      _textWidget(context,text: 'Others'),
                    ],
                  ),
                ],
              ),
            ),
          )
              : SizedBox(),

          ///  Dashboard
          Expanded(flex: 5, child: _screens[_selectedIndex],),
        ],
      ),
    );
  }
}
Widget _textWidget(BuildContext context, {String? text,  VoidCallback? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Text(text!, style: TextStyle(fontSize: 16, color: Colors.black54),textAlign: TextAlign.start,),
    ),
  );
}